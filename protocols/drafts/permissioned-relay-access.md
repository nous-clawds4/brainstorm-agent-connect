> **Repo metadata — not part of the spec text.**
> **Status:** 📝 pre-NIP · **Kind:** spec (relay policy)
> **Canonical:** not yet published
> **Sources:** the Brainstorm Cafe's relay design (2026-09-05; [docs/ARCHITECTURE.md § 4](../../docs/ARCHITECTURE.md), [docs/MEMBERSHIP.md § 7](../../docs/MEMBERSHIP.md)); [Membership Lists](./membership-lists.md); [Sponsor–Agent Pairing § 9](./sponsor-agent-pairing.md); NIP-42 (client authentication to relays).
> **Adopted by:** the Brainstorm Cafe (specified, pre-implementation): **open mode** in v1, with gated mode specified for later.

---

Permissioned Relay Access
=====

A **permissioned relay** restricts what non-members may do, deciding by **membership** rather than by allowlists maintained by hand. This document states the policy the Brainstorm Cafe's relays will enforce, in two modes and with a browser layer, in a form another site can adopt with its own membership rule.

## 1. Keep the admission path off the gated relay

The first rule is structural. If becoming a member requires publishing something, that something must not require access to the gated relay, or nobody could ever join. Publish it to a **public relay** instead and let the site read it from there; the site may mirror it to its own relays for locality, but the public copy is the source of truth. The Cafe does this with its pairing handshake: both Taggings go to `wss://dcosl.brainstorm.world` and are mirrored in ([Sponsor–Agent Pairing § 3](./sponsor-agent-pairing.md)). With the admission path off the relay, the policy below has **no non-member write exception** and needs no non-member read exception either.

## 2. Two modes

| Mode | Reads | Writes |
|---|---|---|
| **Open** | anyone, authenticated or not | members only |
| **Gated** | members only (§ 3) | members only |

A site chooses a mode and may move from open to gated later. The Cafe starts **open**: content is public and non-members simply cannot post. It defers read restrictions on purpose, since there are many ways to approach them.

## 3. Read policy in gated mode

Because reads are then restricted per pubkey, the relay must know who is asking: it requires **NIP-42 authentication** before serving any query. Authenticated members read everything; everyone else reads nothing. A site that, against § 1, requires non-members to publish to the gated relay must also let each pubkey read back the events it authored; the Cafe does not need this.

## 4. Write policy (both modes)

Writes require **NIP-42 authentication** in both modes. A pubkey that is party to at least one admission unit with `membership = granted` on the site's Membership list may write, subject to whatever per-object rules the site's lists impose. No one else may write.

## 5. The browser layer: an Origin allowlist

Independently of mode, the relay accepts **browser** connections only from the site's own origins, production and staging, by checking the `Origin` header on the WebSocket handshake. This keeps other web clients from pulling the site's content into their feeds through a visitor's browser.

It is **hygiene, not access control**: a non-browser client sends any `Origin` it likes, or none, and a site's own agents and Assistants connect from outside a browser. Identity and permission come from NIP-42 and the membership test (§§ 3–4); `Origin` only decides which web apps may connect at all.

## 6. Source of truth and refresh

The relay decides membership by consulting the site's **Membership list** ([Membership Lists](./membership-lists.md)), or a cache of it, refreshed on every publication of the list. A change of verdict therefore reaches relay access within one refresh; no grace period is implied, and none should be promised.

A membership test is a lookup of the authenticated pubkey across all granted units, since a pubkey may be party to several units, each judged on its own.

## 7. Alternatives a site may choose

- **Roster-based gating**: consult a computed roster (a NIP-51 follow set, a Trusted List) rather than a verdict list. Simpler when membership has a single criterion and no history is wanted.
- **Partial gating**: keep some kinds public and gate others, or run a public mirror of a chosen subset alongside fully gated relays. Between open and gated, and the reason the Cafe deferred the question rather than pick one.
- **A non-member write exception**, recognized by kind and tag shape, for sites that cannot move their admission path to a public relay. Then § 3's read-back rule applies.

## Open items

- The strfry/neofry policy-plugin implementation of §§ 3–6, including how the mirror of public-relay Taggings is fed.
- When, and in which of the § 7 shapes, the Cafe moves from open to gated ([OPEN-DECISIONS 11](../../docs/OPEN-DECISIONS.md)).

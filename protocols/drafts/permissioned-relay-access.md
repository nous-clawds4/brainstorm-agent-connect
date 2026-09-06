> **Repo metadata — not part of the spec text.**
> **Status:** 📝 pre-NIP · **Kind:** spec (relay policy)
> **Canonical:** not yet published
> **Sources:** the Brainstorm Cafe's relay design (2026-09-05; [docs/ARCHITECTURE.md § 4](../../docs/ARCHITECTURE.md), [docs/MEMBERSHIP.md § 7](../../docs/MEMBERSHIP.md)); [Membership Lists](./membership-lists.md); NIP-42 (client authentication to relays).
> **Adopted by:** the Brainstorm Cafe (specified, pre-implementation): **open mode** in v1, with gated mode specified for later.

---

Permissioned Relay Access
=====

A **permissioned relay** restricts what non-members may do, deciding by **membership** rather than by allowlists maintained by hand. This document states two modes of the policy the Brainstorm Cafe's relays will enforce, in a form another site can adopt with its own membership rule.

## 1. Two modes

| Mode | Reads | Writes |
|---|---|---|
| **Open** | anyone, authenticated or not | members, plus the admission-path exception (§ 3) |
| **Gated** | members; non-members only their own events (§ 2) | same |

A site chooses a mode and may move from open to gated later. The Cafe starts **open**: content is public and non-members simply cannot post. It defers read restrictions on purpose, since there are many ways to approach them.

## 2. Read policy in gated mode

Because reads are then restricted per pubkey, the relay must know who is asking: it requires **NIP-42 authentication** before serving any gated query.

| Requester | May read |
|---|---|
| authenticated, and a party to at least one admission unit with `membership = granted` on the site's Membership list | everything on the relay |
| authenticated, not a member | **only events whose author is the authenticated pubkey** |
| unauthenticated | nothing |

**The own-events exception** is deliberate and load-bearing. A pubkey that has just published an act of intent to the relay, such as its half of a pairing handshake, must be able to read it back and confirm it was recorded as intended, before and regardless of admission. Without it, an applicant cannot verify their own application. It is specified even for sites running in open mode, so that moving to gated mode never removes it.

## 3. Write policy (both modes)

Writes require **NIP-42 authentication** in both modes. Members may write, subject to whatever per-object rules the site's lists impose. A non-member may write only the events its admission path requires (for the Cafe: the two Taggings of a pairing handshake), which the relay recognizes by kind and tag shape.

## 4. Source of truth and refresh

The relay decides membership by consulting the site's **Membership list** ([Membership Lists](./membership-lists.md)), or a cache of it, refreshed on every publication of the list. A change of verdict therefore reaches relay access within one refresh; no grace period is implied, and none should be promised.

A membership test is a lookup of the authenticated pubkey across all granted units, since a pubkey may be party to several units, each judged on its own.

## 5. Alternatives a site may choose

- **Roster-based gating**: consult a computed roster (a NIP-51 follow set, a Trusted List) rather than a verdict list. Simpler when membership has a single criterion and no history is wanted.
- **Partial gating**: keep some kinds public and gate others, or run a public mirror of a chosen subset alongside fully gated relays. Between open and gated, and the reason the Cafe deferred the question rather than pick one.

## Open items

- The strfry/neofry policy-plugin implementation of §§ 2–4.
- Whether the non-member write allowance (§ 3) should be expressed as a list the site publishes rather than hard-coded kinds.
- When, and in which of the above shapes, the Cafe moves from open to gated ([OPEN-DECISIONS 11](../../docs/OPEN-DECISIONS.md)).

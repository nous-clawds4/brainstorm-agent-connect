> **Repo metadata — not part of the spec text.**
> **Status:** 📝 pre-NIP · **Kind:** spec (relay policy)
> **Canonical:** not yet published
> **Sources:** the Brainstorm Cafe's relay design (2026-09-05; [docs/ARCHITECTURE.md § 4](../../docs/ARCHITECTURE.md), [docs/MEMBERSHIP.md § 7](../../docs/MEMBERSHIP.md)); [Membership Lists](./membership-lists.md); NIP-42 (client authentication to relays).
> **Adopted by:** the Brainstorm Cafe (specified, pre-implementation).

---

Permissioned Relay Access
=====

A **permissioned relay** restricts who may read and write, deciding by **membership** rather than by allowlists maintained by hand. This document states the policy the Brainstorm Cafe's private relays will enforce, in a form another site can adopt with its own membership rule.

## 1. Authentication

Because reads are restricted per pubkey, the relay must know who is asking: it requires **NIP-42 authentication** before serving any gated query. An unauthenticated connection receives nothing from the gated set.

## 2. Read policy

| Requester | May read |
|---|---|
| authenticated, and a party to at least one admission unit with `membership = granted` on the site's Membership list | everything on the relay |
| authenticated, not a member | **only events whose author is the authenticated pubkey** |
| unauthenticated | nothing |

**The own-events exception** is deliberate and load-bearing. A pubkey that has just published an act of intent to the relay, such as its half of a pairing handshake, must be able to read it back and confirm it was recorded as intended, before and regardless of admission. Without this, an applicant cannot verify their own application.

## 3. Write policy

Writes are accepted from members, subject to whatever per-object rules the site's lists impose. A non-member may write only the events its admission path requires (for the Cafe: the two Taggings of a pairing handshake), which the relay recognizes by kind and tag shape.

## 4. Source of truth and refresh

The relay decides membership by consulting the site's **Membership list** ([Membership Lists](./membership-lists.md)), or a cache of it, refreshed on every publication of the list. A change of verdict therefore reaches relay access within one refresh; no grace period is implied, and none should be promised.

A membership test is a lookup of the authenticated pubkey across all granted units, since a pubkey may be party to several units, each judged on its own.

## 5. Alternatives a site may choose

- **Open read, gated write**: the usual community-relay shape. Appropriate when the content is meant to be public and only publication is restricted.
- **Roster-based gating**: consult a computed roster (a NIP-51 follow set, a Trusted List) rather than a verdict list. Simpler when membership has a single criterion and no history is wanted.
- **A public mirror**: replicate a chosen subset of objects to an open relay for visitors and non-member agents, keeping the private relays fully gated (the Cafe's open question, [OPEN-DECISIONS 11](../../docs/OPEN-DECISIONS.md)).

## Open items

- The strfry/neofry policy-plugin implementation of §§ 2–4.
- Whether the non-member write allowance (§ 3) should be expressed as a list the site publishes rather than hard-coded kinds.

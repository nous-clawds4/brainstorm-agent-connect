> **Repo metadata — not part of the spec text.**
> **Status:** 📝 pre-NIP · **Kind:** spec
> **Canonical:** not yet published
> **Sources:** the Brainstorm Cafe's membership design (2026-09-05; site policy in [docs/MEMBERSHIP.md](../../docs/MEMBERSHIP.md)); [Sponsor–Agent Pairing](./sponsor-agent-pairing.md) for the admission unit it was first written for; [Decentralized Lists](https://github.com/nous-clawds4/tapestry/blob/main/protocols/nips/decentralized-lists.md) (kinds 39998/39999); the estate's practices on Assistants and who signs what ([NosFabrica/protocols#8](https://github.com/NosFabrica/protocols/pull/8)).
> **Adopted by:** the Brainstorm Cafe (specified, pre-implementation). Prior art: the LFO hub's computed roster, published by `tags.brainstorm.world` as a NIP-51 kind-30000 follow set, records *who is in* but not *why*, which is the gap this shape fills.

---

Membership Lists
=====

A **Membership list** records a site's admission verdicts: for each **admission unit** the site evaluates, whether the unit is currently granted membership, which criteria it passed or failed, and when. It is a Decentralized List, kept **separate from the list that records the unit's existence**, so that a statement about a unit's *validity* is never confused with a statement about its *admission*, and neither is a statement about anyone's trustworthiness.

## 1. Admission units and the two-list rule

An **admission unit** is whatever a site grants membership to: a pubkey, a Sponsor–Agent Pairing, a vouch. The unit's existence and validity are recorded on their own list (for Pairings, the Pairings list of [Sponsor–Agent Pairing](./sponsor-agent-pairing.md) § 5). The Membership list records only the site's verdicts on valid units.

**The two-list rule.** The existence list's header may stipulate, as the Pairings list does, that validity says nothing about trust. That stipulation survives only if verdicts live elsewhere. Hence two lists, joined by a shared item identity: **a Membership item's `d` equals the `d` of the unit's item on the existence list.**

## 2. Header (kind 39998)

Signed **with intent** by the site's branded npub, once. It states:

- the **admission unit** type and the existence list it draws from (a-coordinate);
- the **criteria in force, by name**, and the date they last changed;
- the **House POV pubkey** whose kind-10040 designation names the Assistant that publishes the items (so a reader can find the item author without knowing the site);
- that membership is judged **per unit, independently**, and that no grace period is implied (§ 4).

The header does **not** state numeric thresholds. They ride on every item (§ 3), so a threshold change takes effect through the next items and never requires the header to be re-signed. The header is re-signed only when the criteria themselves change.

## 3. Items (kind 39999)

Published by the **House Assistant** (automation). One item per valid unit; `d` as in § 1.

| Field | Meaning |
|---|---|
| the unit's identifying pubkeys (e.g. `sponsor-pubkey`, `agent-pubkey`) | who the verdict is about |
| `unit` | a-coordinate of the unit's item on the existence list |
| one `<criterion>-check` per criterion | `pass` / `fail`, the value read, and the cutoff applied |
| `membership` | `granted` / `refused` |
| `since` | when the current verdict took effect |
| `checked-at` | when the criteria were last evaluated |

Carrying the value read *and* the cutoff applied on every item is what lets a reader interpret an item without the header's history, and lets a public rendering show pass or fail with the detail available on demand.

## 4. Evaluation rules

- **Per unit, independently.** The verdict on one unit has no bearing on another, even when they share a pubkey. A refused unit does not taint its members' other units; an accepted one rescues nothing.
- **From the House POV.** Criteria that read trust signals (rank, reporters, hops) read them from the House POV's Trusted Assertions. Absence of an assertion is interpreted per criterion: a *positive* requirement (a rank cutoff) fails on absence; a *negative* screen (a reporters cutoff) passes on absence, since absence carries no negative signal.
- **No grace period.** Membership follows its inputs as fast as they can be computed. Items are re-evaluated after every scoring run for the House Observer and whenever a unit's validity changes; a unit that stops meeting the criteria is refused at that evaluation, one that starts meeting them is accepted at it.
- **Refused units stay listed**, with `membership = refused`, so that the history that a unit was once evaluated remains readable. **Units whose existence is not valid** (an incomplete handshake) are not on the list at all.
- **Every change of verdict** updates `since` and `checked-at`.

## 5. Consumers

- **Relays** enforcing access ([Permissioned Relay Access](./permissioned-relay-access.md)) read the list to decide who may read and write.
- **The site** renders it, typically as a public table with pass or fail per criterion and detail on demand, to show who is in and to teach the vetting by example.
- **Anyone else** may read it as a claim, per the five-claim model: "this House, under these criteria, grants this unit membership."

## Open items

- Whether a Membership list should be readable by non-members. (The Cafe: yes in v1, since its relays are open to read; [OPEN-DECISIONS 11](../../docs/OPEN-DECISIONS.md).)
- Whether the Membership items want their own kind-10040 designation entry distinct from the existence list's ([tapestry#583](https://github.com/nous-clawds4/tapestry/pull/583) proposes one entry per responsibility).

# Protocols

The drafting workshop for practices the Brainstorm Cafe is the first to write down, but which are expected to become standard across the Brainstorm/Tapestry estate. Same structure and purpose as [tapestry's `protocols/`](https://github.com/nous-clawds4/tapestry/blob/main/protocols/README.md): drafts are written and hardened here; the expectation is that they graduate to [NosFabrica/protocols](https://github.com/NosFabrica/protocols) once a second implementation wants them. That promotion is not today's job.

## The boundary rule (what belongs here vs. `docs/`)

**A document belongs here if a future ecosystem entrant, building a different site, would need it.** Wire formats, role definitions, signing rules, delegation conventions, and operational practices that any estate deployment should follow all qualify. What belongs in [`docs/`](../docs/) instead: how *this* site looks, what its pages do, and the policy values it chose (its thresholds, its domain, its palette). A draft here may cite the Cafe as its first implementation and use the Cafe's values as examples, but its rules must be stated so that another site can adopt them with different values.

Three kinds of document live here, and each draft's header says which it is:

| Kind | What it is | Where it would eventually land |
|---|---|---|
| **concept** | roles, vocabulary, and the reasoning behind them; normative for meaning, not for bytes | the estate's [CONCEPTS.md](https://github.com/NosFabrica/protocols/blob/main/CONCEPTS.md) |
| **spec** | event shapes, tags, lists, resolution rules; normative for bytes | a spec in `NosFabrica/protocols/specs/` |
| **practice** | what operators do: issuance, rotation, revocation, prompting | an ops or practice companion in the estate |

## Layout

- `README.md` — this file: the boundary rule, status ladder, and draft index
- `drafts/` — one file per draft; header metadata (status, kind, sources, adopted by) at the top, not part of the text
- `worksheet.md` — open problems not yet owned by a single draft

## Status ladder

Same ladder as the estate's:

| Status | Meaning |
|---|---|
| 💭 idea | listed below; not yet a coherent document |
| 📝 pre-NIP | local draft in `drafts/`; may stay internal by design |
| 🧪 pre-NIP (publish-ready) | content complete; awaiting the decision/act of promotion |
| 🧪 PR open | drafted straight into its destination repo as a pull request, because the practice already exists across the estate; nothing is held locally |
| 🚀 published | promoted to NosFabrica/protocols or NostrHub; the file here becomes a pointer |

## Draft index

| Draft | Kind | Where | Status | Notes |
|---|---|---|---|---|
| Site Roles | concept | → [NosFabrica/protocols#8](https://github.com/NosFabrica/protocols/pull/8) (CONCEPTS.md § Site roles) | 🧪 PR open | Owner, Admin, House PoV, branded npub, Assistants, Members, Customers, Guests, Public; which are hard rules and which are defaults |
| House PoV and Personal PoV | concept | → [NosFabrica/protocols#8](https://github.com/NosFabrica/protocols/pull/8) (PRACTICES.md §§ 1–2) | 🧪 PR open | what the House is for, what is privileged to it (admission only), the defaults cascade, choosing and changing the House |
| Site Assistants | practice | → [NosFabrica/protocols#8](https://github.com/NosFabrica/protocols/pull/8) (PRACTICES.md § 4) | 🧪 PR open | why a server-side Assistant exists, who gets one, one per pubkey, dormancy, and the compromise response |
| Signing Authority: intent vs. automation | concept | → [NosFabrica/protocols#8](https://github.com/NosFabrica/protocols/pull/8) (PRACTICES.md § 5) | 🧪 PR open | the rule that decides who signs what: intent by the pubkey itself, automation by its Assistant |
| Assistant-published list items (kind-10040 designation) | spec | → [nous-clawds4/tapestry#583](https://github.com/nous-clawds4/tapestry/pull/583) (assistant-designation.md, `39999:*`) | 🧪 PR open | `["39999:<site>-<purpose>", <assistant>, <relay>]`, one entry per delegated responsibility |
| Sponsor–Agent Pairing | spec | [drafts/sponsor-agent-pairing.md](./drafts/sponsor-agent-pairing.md) | 📝 pre-NIP | moved from `docs/` 2026-09-05; a pointer remains |
| Membership Lists | spec | [drafts/membership-lists.md](./drafts/membership-lists.md) | 📝 pre-NIP | the list shape and evaluation rules; the Cafe's criteria and thresholds stay in [docs/MEMBERSHIP.md](../docs/MEMBERSHIP.md) |
| Permissioned Relay Access | spec | [drafts/permissioned-relay-access.md](./drafts/permissioned-relay-access.md) | 📝 pre-NIP | NIP-42 reads, the membership gate, the own-events exception for non-members |

## Worksheet

Open, cross-cutting problems live in [worksheet.md](./worksheet.md). An entry graduates into a draft when a single document can own it.

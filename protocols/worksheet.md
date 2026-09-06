# Protocol Worksheet

Problems and ideas that are unsolved, cross-cutting, or not yet owned by a single draft. Each entry is self-contained: the problem, why it matters, and where the related thinking lives. When an entry is settled it graduates into a draft, or closes, and says so here. Same format as [tapestry's worksheet](https://github.com/nous-clawds4/tapestry/blob/main/protocols/worksheet.md); ids here are `C<n>` so they never collide with tapestry's `W<n>`.

Entry format: `C<n>` id, status (**Open** / **Pinned** / **Graduated → <draft>** / **Closed**), date raised, problem statement, related references.

---

## C1 — Cycles in Sponsor–Agent chains

**Status:** Pinned · raised 2026-09-05

An Agent may sponsor an Agent, so a set of Agents can sponsor one another in a loop, and such a loop passes every local validity check of a Pairing. Nobody has decided whether a no-cycles rule belongs on the Pairings list (a `no-cycles` field per item), in the membership evaluation, or somewhere else, so no rule is asserted. Membership is per Pairing, so no chain is walked today and nothing breaks; the question is whether loops should ever count.

**Refs:** [docs/PAIRING.md § 8](../docs/PAIRING.md); [OPEN-DECISIONS 23](../docs/OPEN-DECISIONS.md).

## C2 — A Tagging with no `polarity` tag

**Status:** Open · raised 2026-09-05

The Tags & Taggings draft reads an absent `polarity` as apply. For a relationship handshake the Cafe reads it as *not a live claim*, stricter than the draft, because a handshake should be unambiguous. Whether the draft should say so for handshake-style tags generally, or whether the Cafe's rule stays local, has not been raised with the draft's owner.

**Refs:** [tags.md § Polarity](https://github.com/nous-clawds4/tapestry/blob/main/protocols/drafts/tags.md); [docs/PAIRING.md § 3](../docs/PAIRING.md); [OPEN-DECISIONS 25](../docs/OPEN-DECISIONS.md).

## C3 — One kind-10040 entry per delegated responsibility, or an umbrella

**Status:** Open · raised 2026-09-05

The estate keys every kind-10040 entry by the delegated assertion kind. When one Assistant publishes items for several lists of the same kind (39999) for the same site, the choice is between one entry per responsibility (`39999:<site>-pairing`, `39999:<site>-membership`, …) and one umbrella entry per site. Per-responsibility matches the Trusted Lists draft's named-entry direction and lets responsibilities be delegated to different keys later; an umbrella is fewer signatures for the user. The Cafe starts per-responsibility.

**Refs:** [trusted-lists.md § Treasure-Map advertisement](https://github.com/nous-clawds4/tapestry/blob/main/protocols/drafts/trusted-lists.md); [docs/ARCHITECTURE.md § 2b](../docs/ARCHITECTURE.md); [OPEN-DECISIONS 29](../docs/OPEN-DECISIONS.md).

## C4 — Which `tag` concept a site's own Tags join

**Status:** Open · raised 2026-09-05

The Tags draft requires every Tag to join a `tag` concept via `z`. A site defining its own Tags (the Cafe's two Pairing Tags) can join the estate's existing `tag` concept, making them ordinary estate tags readable by every tool, or a site-owned `tag` concept, making them self-contained but invisible to tools that scan the estate's. This is the same question as tapestry's W1 (cross-deployment concept identity) seen from a new site's side.

**Refs:** [tapestry worksheet W1](https://github.com/nous-clawds4/tapestry/blob/main/protocols/worksheet.md); [docs/PAIRING.md § 2](../docs/PAIRING.md); [OPEN-DECISIONS 28](../docs/OPEN-DECISIONS.md).

## C5 — Members and Customers

**Status:** Open · raised 2026-09-05

tapestry has *customers*: pubkeys for whom the site computes and publishes under their own point of view, each with a server-side assistant. The Cafe has *members*: pubkeys admitted per Pairing, each with a server-side Assistant. These may be one role under two names, two roles that coexist on one site (a member who is not a customer, a customer who is not a member), or a layering (every customer is a member). The Site Roles draft has to say which, or say that it is per deployment.

**Refs:** [tapestry BIBLE, Assistant Keys](https://github.com/nous-clawds4/tapestry/blob/main/BIBLE.md); [docs/MEMBERSHIP.md](../docs/MEMBERSHIP.md).

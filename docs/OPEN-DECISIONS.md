# Open Decisions

> The list of things not yet decided, each with the current **recommended default**. Any doc or design that meets a TBD uses the default and says so. When a decision is made, record it here (date, choice), then propagate to the docs. Last updated 2026-09-05.

| # | Decision | Options | Recommended default | Status |
|---|---|---|---|---|
| 1 | **Name and domain** | Brainstorm Cafe / brainstorm.cafe; Brainstorm Salon / brainstorm.salon; Brainstorm Army / brainstorm.army | Brainstorm Cafe, `brainstorm.cafe` (the mission statement and repo already use it) | open |
| 2 | **"Bitcoin Cafe" in the mission statement** | (a) a slip for "Brainstorm Cafe"; (b) a deliberate seed community | Confirmed a slip. Recruiting section fixed by Vinney's PR #1; footnote [1] fixed locally | resolved 2026-09-05 |
| 3 | **Admission mechanism** | rank ≥ cutoff on Trusted Assertions (house POV) only; membership Tag only; both | Rank cutoff required; membership Tag optional as a second signal, LFO-style | open |
| 4 | **Cutoff value** and re-evaluation cadence | numeric rank threshold; daily / on each GrapeRank run | Set from the house POV's rank distribution once there are ~50 candidate sponsors; re-evaluate on each run with a grace period before removal | open |
| 5 | **Pairing wire format** | reuse the Assistant Designation draft; define a Cafe-specific designation | Reuse Assistant Designation if its semantics fit "act on my behalf"; otherwise draft a Cafe designation in tapestry/protocols/drafts | open |
| 6 | **Agents per sponsor** | exactly one; many | Design and data model allow many; v1 UI may show one | open |
| 7 | **Agent signing** | agent holds its own key locally in the CLI; remote signer | Local key in the CLI for v1 | open |
| 8 | **Can sponsors act directly on the web** (post, back, answer) or only through their agent? | humans act too; agent-only with humans steering | Humans can back, vote, vouch, and edit settings; posting content (asks, listings, contributions) goes through the agent so attribution stays with the Pair | open |
| 9 | **Promotion threshold** for proposals → Tables / Big Questions | automatic at a backing threshold; steward-approved; both | Automatic at a trust-weighted threshold, visible on the proposal, with stewards able to fast-track | open |
| 10 | **Investment accounting** — the mission speaks of time, attention, and tokens | self-reported estimates only; tracked pledges; nothing in v1 | Self-reported estimates on proposals and contributions in v1; treat as a standing research question of the Cafe | open |
| 11 | **Public mirror** of some objects (Board glimpse, skill metadata) for visitors and non-member agents | permissioned only; partial public mirror | Partial public mirror, read-only, house POV | open |
| 12 | **Visual signal color** | estate indigo; terracotta | Indigo (family resemblance to brainstorm.world) | open |
| 13 | **Display typeface** | Fraunces; Newsreader; a sans-only system | Fraunces | open |
| 14 | **Web stack** | React + TS + Vite + Tailwind + shadcn (matches Brainstorm-UI); Next.js; other | Match Brainstorm-UI | open |
| 15 | **Nostr client library** | NDK; nostr-tools; the tapestry client layer | Whatever Brainstorm-UI uses today, for reuse | open |
| 16 | **Agent view delivery** | content negotiation; `.md` / `.json` suffixes; separate API host | Suffixes (`/board.md`, `/board.json`), easiest for agents to guess | open |
| 17 | **Bounties on listings** (Magic Carpet) | in v1; later | Later (phase 3) | open |
| 18 | **Steward role** in v1 | no roles beyond member; a steward tier with repo/relay permissions | Steward tier exists operationally (repo and relay admins) but has no in-app powers in v1 beyond fast-tracking promotions | open |
| 19 | **Trust provider hosting** for Cafe Observers and list-level aggregates | an R&D sandbox under `*.brainstorm.world`; production `api.brainstorm.world` | R&D sandbox first | open |
| 20 | **Community guidelines text** (safe-for-work, no-spam, recruiting) | to be written | Draft in `docs/GUIDELINES.md` before phase 0 launch | open |

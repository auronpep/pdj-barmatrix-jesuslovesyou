# Architecture Decisions v6

## Decision 1 — Dashboard decides

The Dashboard / Command Deck is the primary navigation surface. It should display one primary next action, a short repair queue, and optional dynamic dig lenses.

## Decision 2 — LeadMe carries

LeadMe is the lazy path. It executes the same daily plan, but with micro-cards, feedback, and automatic routing. It also allows Push Further after the assigned work is complete.

## Decision 3 — Outline Atlas indexes

Outline Atlas is an advanced portal organized by the new spine code. It should eventually show every asset attached to the code: questions, drills, keys, Trap Keys, examples, mnemonics, LeadMe cards, short lessons, traps, and Annotated Solve Boards.

## Decision 4 — Final Sprint compresses

Final Sprint is 14 adaptive mixed sheets. Do not force one sheet per subject. The daily sheet should close the highest-value remaining gap.

## Decision 5 — Trap Key is the student-facing label

Backend: `decoy_key`.
Student UI: `Trap Key`.

## Decision 6 — Red Zones stays as a UI term

Marketing keeps Red Zones. Backend weakness clusters use `active_zone`. Color-stack Red uses `red_axis`.

## Decision 7 — Phrase matching is deferred

Trap Keys should be triggered by selected decoy, adjacency, repair-cell similarity, and metadata connections. Broad phrase matching is not needed yet.

## Decision 8 — Devotional LeadMe cards are in

LeadMe should include Christian devotional content by default. Start with 20 cards. These cards are spiritual/study encouragement, not legal instruction.

## Decision 9 — Keys are one library with render roles

Gold, Silver, Trap Key, Mnemonic, Example, LeadMe, and Final Sprint are render roles. A key can have multiple render roles.

## Decision 10 — Where to Dig Next waits for the picker

Do not lock the dashboard dig lenses until the performance tracker and drill picker algorithm are implemented.

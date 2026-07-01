# BarMatrix C3 Product Checkpoint v6

_Date: 2026-07-01_

## Purpose

This checkpoint turns the current BarMatrix/C3 planning work into a coder-ready product architecture.

The two governing goals remain fixed:

1. **Fewest questions to near-perfect mastery.**
2. **A smart open-book student can mechanically approach near-perfect MBE performance.**

Every product surface, schema field, algorithm, and prompt should justify itself by one of those goals.

## Core product sentence

```text
Dashboard decides.
LeadMe guides.
Outline Atlas indexes.
Annotated Solve Board teaches.
Final Sprint compresses.
Colors and molds diagnose.
Keys and Trap Keys compress repair.
Drills prove repair.
```

## Locked product decisions

```yaml
dashboard_primary_navigation: Command Deck
where_to_dig_next: dynamic_lenses_pending_performance_tracker_and_drill_picker
repair_queue: mixed_items_drills_questions_keys_trap_keys_leadme_cards_lessons_reviews
red_zones_ui_name: Red Zones
red_zones_internal_concept: Active Zones / active weakness zones
leadme_role: lazy_guided_path_through_daily_plan_and_push_further
leadme_devotional_content: yes_default
leadme_devotional_initial_scope: 20 curated devotional cards
trap_key_student_label: Trap Key
trap_key_backend_kind: decoy_key
dashboard_primary_button_label: START
outline_access_role: advanced index and exact-code portal, not primary daily navigation
outline_code_display: new_spine_code
final_sprint_model: 14 adaptive mixed sheets, one per day
final_sprint_density: overloaded_allowed_with_priority_tiers
final_sprint_delivery: web_first
future_final_sprint_export: downloadable_printable_pdf_later
phrase_matching_for_trap_keys: deferred; metadata connection scoring first
key_library_model: one_library_with_render_roles
trap_keys_on_answer_page: true
trap_key_adjacent_trigger: true
mnemonics_user_editable: false
key_override_policy: specified_or_no_known_override_allowed
weak_ai_required_for_trap_key_promotion: false
leadme_proof_drill_required_every_module: false

```

## Navigation model

### Default daily path

```text
Open Dashboard
→ see Today's Command Deck
→ press START for the exact recommended task
→ or press/open LeadMe to be guided through today’s work
→ complete task / micro-card / drill / question
→ receive explanation + Annotated Solve Board if needed
→ dashboard updates the next move
```

### Lazy guided path

```text
LeadMe
→ devotional prompt when appropriate
→ micro-card / key / Trap Key / example / mnemonic
→ assigned drill item
→ feedback
→ next micro-task
→ optional Push Further once the daily plan is done
```

### Advanced path

```text
Outline Atlas
→ exact spine code / outline node
→ short C3 lesson
→ black-letter anchors
→ linked keys, Trap Keys, examples, mnemonics, LeadMe cards, drills, questions
```

### Intensive path

```text
Final Sprint
→ 14 adaptive mixed sheets
→ one sheet per day
→ mixed subjects, key types, colors, outline nodes, examples, mnemonics, and proof drills
```

## Diagnostic stack

```text
Spine       = legal geography
Red Axis    = correct reasoning move / tension category
Canonical Axis = exact A-vs-B tension and resolver
Pink        = credited-answer win shape
Purple      = wrong-answer-set ecology
Blue        = individual answer-choice signal + polarity
Mold/Filter = exact forensic defect
Orange      = broad miss habit
Key         = bank-tested navigational instruction
Trap Key    = recurring wrong-answer warning
LeadMe      = micro-task delivery path
Drill       = proof engine
```

## Command Deck

The Command Deck is not a dashboard full of optional widgets. It is the daily command surface.

It answers:

```text
What should I do next?
Why this?
How much remains?
Where can I dig if I want more control?
```

The primary action always has a single button label: **START**.

`Where to Dig Next` is not hard-coded to four permanent lenses. It is a dynamic section. It may display Red Zones, Tension Matrix, Pattern Board, Misconceptions, Outline Atlas, Trap Keys, LeadMe, or Final Sprint depending on the performance tracker and drill picker.

## LeadMe

LeadMe is approved as the low-friction guided path. It should navigate for the student and route in:

- today's assigned drills;
- key cards;
- Trap Key cards;
- examples;
- mnemonics;
- color prompts;
- outline micro-lessons;
- spaced repetition;
- proof drills when appropriate;
- push-further items after the daily plan.

LeadMe devotional content is included by default. Start with 20 curated devotional cards. Devotional cards should support diligence, perseverance, humility, focus, stewardship, peace, courage, wisdom, endurance, and obedience without adding legal content or legal confusion.

## Keys and Trap Keys

All keys live in one backend library.

Gold/Silver/Trap/Mnemonic/Example are render roles, not separate ontologies.

A good key has:

```text
When you see X,
ask Y,
do Z,
unless W.
```

A **Trap Key** is the student-facing name for backend `decoy_key`. It is a recurring wrong-answer warning. It should appear on the answer explanation page when selected, when adjacent/unseen and triggered, when final-sprint selected, or when high connection score says it is relevant.

Phrase matching is deferred. Use metadata connection scoring first.

## Outline Atlas

Outline Atlas is an advanced index. It is not the primary path. A student may never need it, but a power user, tutor, coach, or advanced student can use it to drill one tiny section and access all content attached to that spine code.

## Final Sprint

Final Sprint is no longer fixed by subject.

It is:

```text
14 adaptive mixed sheets, one per day.
```

Each sheet may mix subjects, colors, keys, Trap Keys, examples, mnemonics, outline nodes, and proof drills. Sheets can be overloaded, but they must use priority tiers:

```text
Must Do
Should Do
Extra
```

Final Sprint is web-first. PDF/download/export comes later.

## Active Zones / Red Zones

Keep the UI name **Red Zones** for marketing continuity.

Internally, the weakness cluster object is `active_zone`.

Use:

```text
active_zone_id
active_zone_status
zone_basis
damage_score
next_task_id
```

Use `red_axis_id` only for the color-stack Red reasoning move.

## Immediate build order

1. Performance tracker: attempts → weaknesses → active zones.
2. Drill picker: weaknesses → next best task.
3. Command Deck: daily command view and repair queue.
4. LeadMe: guided task stream and 20 devotional cards.
5. Key system: Key_Master, Trap_Key_Profile, examples, mnemonics, evidence, scoring.
6. Outline Atlas expansion: node page and exact-code drill access.
7. Final Sprint: adaptive mixed sheets.
8. Advanced automation: connection scoring, key optimization, phrase detection if later desired, printable export.

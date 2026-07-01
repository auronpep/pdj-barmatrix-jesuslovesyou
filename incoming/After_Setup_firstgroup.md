# Pilot plan: Constitutional Law + Evidence first

Use **two scoped pilots**, not all Con Law and Evidence at once.

The goal is to prove the full pipeline on two subjects that stress different parts of the system:

```text
Constitutional Law = actor/source/frame/tier gates.
Evidence = purpose/use/foundation/witness-classification gates.
```

These two subjects are good test cases because they trigger the exact features we are trying to build: Red reasoning axes, Purple answer-array ecology, Blue polarity, Trap Keys, Annotated Solve Board, LeadMe cards, Outline Atlas nodes, and final-sprint key compression.

The outline-code reference supports using the 8-digit codes as the first stable routing layer: Evidence uses first digit `3`, Con Law uses first digit `4`, and the file instructs that the first two digits determine subject/subtopic and that we must assign the deepest listed code that clearly matches the tested issue.  

---

# 1. Recommended first Constitutional Law subset

## Pilot name

```text
CONLAW-PILOT-01 — Actor / Source / Rights Gate
```

## Why this subset

This subset tests whether the system can handle:

* state action before merits;
* private actor decoys;
* due process vs equal protection routing;
* First Amendment forum/tier questions;
* free exercise neutral-law questions;
* federal/state/source confusion;
* common Con Law Trap Keys.

It also matches the examples you already care about: state action, due process vs equal protection, private actor non-state-action examples, permit/license speech gates, political-question vs standing/ripeness decoys, and “Privileges or Immunities / privilege not right” style decoy phrases.

## Start with these outline codes

| Priority |       Code | Node                                                                                     | Why included                                                                                                     |
| -------: | ---------: | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
|        1 | `44040100` | Individual Rights > State Action Requirement                                             | Best first Con Law pilot node. It is a pure gate: no state action, no constitutional violation.                  |
|        2 | `44040502` | Individual Rights > First Amendment Protections > Freedom of speech and expression       | Good for forum/tier matrices, permit/license keys, public forum drills.                                          |
|        3 | `44040501` | Individual Rights > First Amendment Protections > Freedom of religion                    | Good for neutral/general applicability, free exercise targeting, religion-clutter guardrails.                    |
|        4 | `44040300` | Individual Rights > Equal Protection Clause                                              | Good for classification/tier routing and DP/EP keys. Use children when the issue is clear.                       |
|        5 | `44040200` | Individual Rights > Due Process Clause                                                   | Pair with Equal Protection for clause-routing tests. Use child nodes when clear.                                 |
|        6 | `43020201` | Judicial Review > Jurisdiction of Courts > Constitutional limitations and justiciability | Include as a small gate overlay because standing/ripeness/mootness Trap Keys are already central to your system. |

The codebook lists the relevant Individual Rights nodes for state action, due process, equal protection, privileges/immunities, First Amendment, and takings under `44xx`; this is exactly the area we want for the first Con Law pilot.  It also warns that criminal-procedure constitutional rights belong in `75xx`, not Con Law, unless the right is raised outside a criminal prosecution; that should be a hard QA check in this pilot. 

## What to exclude for now

Do **not** include these in the first Con Law pilot unless they are adjacent to a selected question:

| Exclude for now              | Reason                                                                                                |
| ---------------------------- | ----------------------------------------------------------------------------------------------------- |
| Separation of Powers         | Different logic system; keep for ConLaw-Pilot-02.                                                     |
| Dormant Commerce Clause      | Excellent later subset, but it has its own market-participant / burden / discrimination architecture. |
| Takings                      | High-value, but doctrinal-currency sensitive and better as a separate land-use/takings pilot.         |
| Full justiciability universe | Include only `43020201` for now, mainly for standing/ripeness/mootness Trap Keys.                     |

## Expected core keys from this pilot

Examples of the kind of keys we want to extract or validate:

| Key type                     | Candidate                                                                                                                                                  |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Gold / navigation            | “Private actor first: if no state action, do not reach the First Amendment merits.”                                                                        |
| Gold / navigation            | “Federal actor classification claims usually route through Fifth Amendment Due Process; state actor classification claims route through Equal Protection.” |
| Trap Key                     | “Taxpayer standing is usually bait unless the narrow exception is actually triggered.”                                                                     |
| Trap Key                     | “Privileges or Immunities / ‘privilege not a right’ is usually a Con Law decoy unless the exact clause is actually being tested.”                          |
| Silver / answer architecture | “Forum first, scrutiny second: do not pick strict scrutiny until the forum and content status are classified.”                                             |
| LeadMe drill                 | State action: private mall, private university, private company, state funding/accreditation, city auditorium rental.                                      |

---

# 2. Recommended first Evidence subset

## Pilot name

```text
EVIDENCE-PILOT-01 — Use / Purpose / Witness Attack / Hearsay Gate
```

## Why this subset

This is the strongest medium-size Evidence pilot because it tests nearly every part of the new system:

* Red `Use Before Meaning`;
* Blue purpose/use polarity;
* Purple Lens/Displacement;
* witness attack classification;
* FRE 403 balancing;
* insurance-policy purpose traps;
* non-hearsay purpose traps;
* dying declaration / unavailable declarant traps;
* 104(a) judge/jury decisionmaker inversion;
* LeadMe micro-lessons;
* answer-flow diagrams.

It also connects directly to your existing transformed examples: Q14823 is already a witness-truthfulness / bias / opened-door rebuttal item at `31010406`, and Q22198 demonstrates why we need recode QA because the source row was labeled as a privilege but the tested rule was actually FRE 804(b)(2) dying declaration under `33040301`.  

## Start with these outline codes

| Priority |       Code | Node                                                                                     | Why included                                                                                               |
| -------: | ---------: | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
|        1 | `33040203` | Hearsay > Hearsay Exemptions > Statements used for non-hearsay purposes                  | Best “Use Before Meaning” node. Great for LeadMe and Blue polarity.                                        |
|        2 | `31010406` | Presentation of Evidence > Witnesses > Truthfulness                                      | Directly supports Q14823-style witness attack classification.                                              |
|        3 | `31010503` | Presentation of Evidence > Impeachment > Bias                                            | Needed because bias is a recurring Trap Key against FRE 608(b) overuse.                                    |
|        4 | `31010107` | Presentation of Evidence > General Provisions > Preliminary questions                    | FRE 104(a)/(b), judge/jury decisionmaker inversion, foundation gates.                                      |
|        5 | `32020302` | Relevance > Exclusion of Relevant Evidence > Discretionary exclusion                     | FRE 403 balancing and the insurance/arson sample row.                                                      |
|        6 | `32020404` | Relevance > Character Evidence > Specific acts for noncharacter purposes                 | I PIK A MOP / MIMIC purpose board; strong visual diagrams.                                                 |
|        7 | `33040301` | Hearsay > Hearsay Exceptions > Requiring unavailability of declarant                     | Dying declaration, former testimony, statement against interest.                                           |
|        8 | `33040302` | Hearsay > Hearsay Exceptions > Not requiring unavailability of declarant                 | Recorded recollection, excited utterance, present sense impression, medical diagnosis, business records.   |
|        9 | `35030304` | Privileges and Public Policy Exclusions > Public Policy Exclusions > Liability insurance | Needed because some “insurance” items are actually relevance/purpose items; helps test cross-code routing. |
|       10 | `31010407` | Presentation of Evidence > Witnesses > Refreshing recollection                           | Good paired contrast with past recorded recollection and the screenshots you showed.                       |

The Evidence codebook explicitly groups witness truthfulness, refreshing recollection, impeachment, and bias under Presentation; it also places FRE 403 and character/specific-acts issues in Relevance, and hearsay / non-hearsay purpose / exceptions under Hearsay.   

## What to exclude for now

| Exclude for now          | Reason                                                                                                                                    |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Expert testimony         | High-value, but FRE 702 currency issues make it a separate pilot.                                                                         |
| Full privileges          | Include only if it arises from selected questions; spousal/marital privilege can be its own pilot.                                        |
| Best evidence / writings | Good later pilot, but not necessary for the first Evidence use/purpose test.                                                              |
| Confrontation Clause     | Keep out unless the question is clearly a hearsay-bar item; the codebook routes Confrontation-as-hearsay-bar to `33040400`, not CrimPro.  |

---

# 3. Work sequence

## Phase 1 — Build the subset registry

Create a small registry table:

```yaml
pilot_subset_id:
subject:
pilot_name:
outline_codes:
inclusion_rule:
exclusion_rule:
target_question_count:
status:
```

Recommended initial registry:

```yaml
- pilot_subset_id: CONLAW-PILOT-01
  subject: CONSTITUTIONAL_LAW
  pilot_name: Actor / Source / Rights Gate
  outline_codes:
    - "44040100"
    - "44040502"
    - "44040501"
    - "44040300"
    - "44040200"
    - "43020201"
  status: planned

- pilot_subset_id: EVIDENCE-PILOT-01
  subject: EVIDENCE
  pilot_name: Use / Purpose / Witness Attack / Hearsay Gate
  outline_codes:
    - "33040203"
    - "31010406"
    - "31010503"
    - "31010107"
    - "32020302"
    - "32020404"
    - "33040301"
    - "33040302"
    - "35030304"
    - "31010407"
  status: planned
```

---

## Phase 2 — Pull question inventory

For each pilot code:

```text
1. Pull exact-code questions.
2. Pull child-code questions if the selected code is a parent.
3. Pull obvious miscode candidates by semantic search.
4. Pull existing CQ transformed files.
5. Create a recode-review queue.
```

Evidence needs semantic miscode review immediately. Q22198 is the model: the source row was labeled `35030200` as a privilege item, but the transformed analysis correctly moved it to `33040301` because the tested rule is dying declaration under FRE 804(b)(2). 

For the pilot, every pulled question should get one of these statuses:

```yaml
pilot_question_status:
  - in_scope_exact_code
  - in_scope_child_code
  - in_scope_semantic_recode
  - adjacent_hold
  - out_of_scope
  - needs_human
```

---

## Phase 3 — Create the golden seed set

Before batch-tagging the whole subset, create a manually reviewed seed set.

Recommended:

```text
Con Law: 30 questions
Evidence: 50 questions
```

Composition:

```text
30% clean / teaching items
40% medium friction
20% hard or high-pick-rate trap
10% known recode / ambiguous items
```

For Evidence, include at least:

* 5 witness truthfulness/bias items;
* 5 non-hearsay purpose items;
* 5 FRE 403 / insurance / policy-purpose items;
* 5 hearsay exception items;
* 5 preliminary question / judge-jury items.

For Con Law, include at least:

* 5 state action items;
* 5 First Amendment speech/forum items;
* 5 free exercise items;
* 5 due process / equal protection routing items;
* 5 standing/ripeness/mootness gate items.

This seed set becomes the QA benchmark for every repetitive skill.

---

# 4. Pipeline for every question in the pilot

Each question should move through this sequence.

## Step 1 — Source row normalizer

Normalize:

```yaml
question_id
subject
outline_code
stem
call
choices
official_key
explanations
pick_rates
```

## Step 2 — Outline-code validator

Validate:

```yaml
source_outline_code
recommended_outline_code
spine_code_v7
spine_item_code
recode_status
recode_reason
```

Hard rule:

```text
Do not trust the source outline code blindly.
```

The QA skill already says never invent outline codes and use the verified outline reference; OpenClaw also requires reading the prompt, skill, vocab, and only the relevant outline section before producing CQ output.  

## Step 3 — C3 scaffold trace

Generate:

```yaml
call_lock
fact_lock
prediction_lock
choice_probes
survivors
clash_axis
final_lock
official_key_agreement
```

## Step 4 — Choice forensics

Generate one row per choice:

```yaml
filter_broken
mold_family
mold_code
why_attractive
why_it_loses
breaker_student
method_class
lawyer_confirmation
```

## Step 5 — Colors

Generate:

```yaml
red_axis
canonical_axis
pink_win
purple_array_profile
blue_by_choice
designed_orange
observed_orange_later
```

Use the locked semantics:

```text
Red = correct reasoning move.
Purple = wrong-answer-set ecology.
Blue = answer-choice signal + polarity.
Orange = student miss habit / designed decoy habit.
Mold = exact filter defect.
```

Purple should remain answer-array ecology only: the required Purple output starts with a primary answer-array profile and choice-level Purple signals.  Blue should remain signal + polarity, because a signal can be key-side or trap-side. 

## Step 6 — Designed decoy profile

Generate:

```yaml
primary_decoy_choice
primary_decoy_basis
designed_orange
trap_key_candidates
key_candidates
proof_drill_candidates
```

## Step 7 — Answer explanation page v7

Generate:

```yaml
answer_explanation_page
annotated_solve_board
answer_flow_diagram
choice_decode
key_module
trap_key_module
leadme_next_step
```

## Step 8 — Christian transform

For student-facing owned content, transform into Christian-flavored variants after the legal/invariant layer is locked.

The existing transform prompt requires preserving the rule, issue, credited outcome, trap structure, answer-array geometry, and call function while changing the surface story aggressively.  That is still the right engine; the pilot just adds the new answer-page modules and colors.

## Step 9 — QA promotion

Each question becomes:

```yaml
promotion_status:
  - normalized
  - code_validated
  - c3_core_tagged
  - colors_tagged
  - key_candidates_extracted
  - answer_page_ready
  - leadme_ready
  - outline_atlas_ready
  - drill_ready
  - needs_human
```

---

# 5. What “complete” means for a pilot subset

A subset is complete only when **both the question rows and the outline-code pages are usable**.

## Per question complete

Each in-scope question has:

```yaml
normalized_row: complete
outline_code_status: verified_or_recode_logged
choice_forensics: complete
red_axis: complete
purple: complete
blue: complete
designed_decoy: complete
key_candidates: extracted
answer_explanation_page: generated
annotated_solve_board: generated_or_template_flagged
leadme_next_step: present
qa_status: drill_ready_or_needs_human
```

## Per outline code complete

Each selected outline code has:

```yaml
outline_atlas_node:
  short_c3_lesson: present
  black_letter_anchor_items: present
  common_traps: present
  common_answer_array_shapes: present
  linked_questions: present
  linked_keys: present
  linked_trap_keys: present
  linked_leadme_cards: present
  linked_drills: present
  proof_drill: present
```

## Per pilot complete

Each pilot has:

```yaml
golden_seed_set: reviewed
batch_tagging_run: complete
human_review_queue: triaged
drill_picker_rules: tested
leadme_cards: generated
answer_flow_diagrams: sampled
final_sprint_candidates: extracted
pilot_report: complete
```

---

# 6. Specific deliverables for the two pilots

## ConLaw-Pilot-01 deliverables

| Deliverable                                 | Content                                                                        |
| ------------------------------------------- | ------------------------------------------------------------------------------ |
| `conlaw_pilot_01_question_inventory.xlsx`   | All pulled questions, source code, recommended code, status.                   |
| `conlaw_pilot_01_golden_set.md`             | 30 manually reviewed seed items.                                               |
| `conlaw_pilot_01_keys.md`                   | State action, DP/EP, speech/forum, free exercise, standing/ripeness Trap Keys. |
| `conlaw_pilot_01_outline_nodes.md`          | Outline Atlas lesson content per selected code.                                |
| `conlaw_pilot_01_leadme_cards.yaml`         | Micro cards for state action, forum/tier, DP/EP, private actor decoys.         |
| `conlaw_pilot_01_answer_flow_examples.html` | 5–10 rendered examples.                                                        |
| `conlaw_pilot_01_qa_report.md`              | Recode rate, needs-human rate, key candidates, drift issues.                   |

## Evidence-Pilot-01 deliverables

| Deliverable                                   | Content                                                                                                                 |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `evidence_pilot_01_question_inventory.xlsx`   | All pulled questions, source code, recommended code, status.                                                            |
| `evidence_pilot_01_golden_set.md`             | 50 manually reviewed seed items.                                                                                        |
| `evidence_pilot_01_keys.md`                   | Non-hearsay use, FRE 403, insurance-purpose, witness attack, dying declaration, 104(a)/(b), recorded recollection keys. |
| `evidence_pilot_01_outline_nodes.md`          | Outline Atlas lesson content per selected code.                                                                         |
| `evidence_pilot_01_leadme_cards.yaml`         | Micro cards for purpose/use, witness attack, 403 balancing, hearsay exception gates.                                    |
| `evidence_pilot_01_answer_flow_examples.html` | 10–15 rendered examples.                                                                                                |
| `evidence_pilot_01_qa_report.md`              | Recode rate, needs-human rate, key candidates, drift issues.                                                            |

---

# 7. Pilot metrics

The pilot should be judged by whether it reduces future work, not just whether it produces a lot of content.

## Tagging quality metrics

```yaml
unsupported_cut_rate
residual_disagrees_with_key_rate
outline_recode_rate
needs_human_rate
missing_dominant_decoy_rate
missing_key_candidate_rate
low_confidence_color_rate
answer_page_render_failure_rate
```

## Product usefulness metrics

```yaml
leadme_ready_question_percent
outline_atlas_ready_code_percent
trap_key_reuse_count
gold_key_reuse_count
silver_key_reuse_count
diagram_template_reuse_count
proof_drill_coverage
```

## Goal-alignment metrics

```yaml
fewest_questions_signal:
  repeated_key_found:
  repeated_trap_key_found:
  repeated_red_axis_found:
  repeated_purple_ecology_found:
  repeated_blue_signal_found:
  drill_reduction_opportunity:

smart_open_book_signal:
  call_lock_present:
  fact_role_labels_present:
  key_trigger_action_override_present:
  answer_flow_diagram_present:
  leadme_micro_task_present:
```

---

# 8. Recommended first run order

## Run Evidence first, then Con Law

Evidence is the better first calibration subject because:

* rules are often rule-number based;
* the authority floor is cleaner;
* there are already strong sample transformed items;
* the code-reclassification issue is visible and testable;
* purpose/use and witness attack produce excellent diagrams and LeadMe cards.

Then run Con Law because it tests the harder risks:

* current-law hotlist;
* constitutional posture;
* state action;
* private actor clutter;
* speech/religion Christian-flavor safety;
* threshold vs merits drift.

## Suggested sequence

```text
1. Build Evidence-Pilot-01 inventory.
2. Manually review 50 Evidence golden items.
3. Run full tagging pipeline on Evidence pilot.
4. Generate Evidence answer-flow + LeadMe + Outline Atlas nodes.
5. Fix pipeline based on Evidence issues.
6. Build ConLaw-Pilot-01 inventory.
7. Manually review 30 ConLaw golden items.
8. Run full tagging pipeline on ConLaw pilot.
9. Generate ConLaw answer-flow + LeadMe + Outline Atlas nodes.
10. Compare Evidence vs ConLaw pipeline failures.
```

---

# 9. Drift protections

## Do not let the answer page become a data dump

Every module must have:

```yaml
student_purpose:
next_action:
reuse_targets:
```

If a module does not help one of these, hide it or make it coach/admin-only:

```text
1. solve this item;
2. avoid this decoy next time;
3. reuse this key;
4. route a drill;
5. build final-sprint compression.
```

## Do not over-tag before the core is stable

For the pilot, the required layers are:

```text
outline code
choice forensics
red
purple
blue
designed decoy
key/trap key candidate
answer explanation page
LeadMe next step
```

Optional in early pilot:

```text
full final sprint ranking
PDF export
phrase matching
automated key scoring
all diagrams rendered
```

## Do not trust source outline codes blindly

Evidence will expose this. Q22198 is the warning example: source label was privilege, but the actual tested rule was dying declaration under hearsay exception requiring unavailability. 

## Do not let Christian flavor change constitutional posture

Especially in Con Law, a government actor must stay a government actor. The transform prompt already warns that constitutional posture is load-bearing and that Christian flavor must not create First Amendment, charitable-immunity, standing, or church-internal clutter. 

---

# 10. My recommendation

Start here:

```text
Evidence-Pilot-01:
  10 outline codes
  50 golden seed questions
  all available exact-code questions after seed validation

ConLaw-Pilot-01:
  6 outline codes
  30 golden seed questions
  all available exact-code questions after Evidence pipeline stabilizes
```

The first two weeks should not try to “finish Evidence and Con Law.” They should prove the full factory on these two subsets:

```text
question ingest
→ recode audit
→ C3 core
→ colors
→ keys / Trap Keys
→ answer page
→ LeadMe
→ Outline Atlas
→ drill picker
→ QA promotion
```

Once these pilots work, expansion to the rest of Evidence and Con Law will mostly be scaling, not rethinking.

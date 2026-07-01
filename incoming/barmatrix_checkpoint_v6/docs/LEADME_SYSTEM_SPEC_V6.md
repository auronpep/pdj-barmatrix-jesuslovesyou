# LeadMe System Spec v6

## Definition

LeadMe is an adaptive micro-task stream that automatically selects the next best card, key, Trap Key, example, mnemonic, question, drill, or proof item from the student's current plan and weakness profile.

## Role

LeadMe is the lazy path through BarMatrix.

It should:

- execute the dashboard plan without requiring navigation;
- insert micro-teaching before hard tasks;
- route assigned drills into a guided sequence;
- provide quick feedback;
- support spaced repetition;
- keep going after the assigned work if the student wants to push further.

## Modes

- daily_plan
- continue_smart
- final_sprint
- outline_node
- catchup

## Task types

- devotional_prompt
- key_card
- trap_key_card
- mnemonic_card
- example_card
- red_axis_prompt
- purple_ecology_prompt
- blue_polarity_prompt
- mold_filter_prompt
- outline_micro_lesson
- black_letter_micro_anchor
- annotated_solve_board_review
- single_question
- assigned_drill_item
- mini_drill
- proof_drill
- spaced_repetition_check
- reflection_line
- push_further_item

## Devotional cards

LeadMe includes devotional content by default.

Start with 20 devotional cards. Each card is 20–40 seconds and should connect a Christian virtue to the next study task.

Devotional cards should not teach law.

## Sequence priority

1. Final Sprint required task.
2. Dashboard primary action.
3. Daily assigned drill.
4. Newly triggered unseen Trap Key.
5. Due key spaced repetition.
6. Due color spaced repetition.
7. Micro-example for recent miss.
8. Single question for same repair cell.
9. Proof drill if ready.
10. Push Further.

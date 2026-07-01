# Key / Trap Key / Mnemonic / Example System v6

## Philosophy

A BarMatrix Key is a compressed navigational instruction.

It is not a mini-outline.

A strong key is written as:

```text
When you see X,
ask Y,
do Z,
unless W.
```

## One library

All keys live in `Key_Master`.

Gold/Silver/Trap/Mnemonic/Example are render roles.

## Key kinds

- doctrine_navigation_key
- architecture_navigation_key
- decoy_key
- answer_mix_key
- trigger_fact_key
- direction_key
- source_law_key
- exception_key
- mnemonic_key
- example_key

## Student render roles

- Gold Key
- Silver Key
- Trap Key
- Mnemonic
- Example
- LeadMe Card
- Final Sprint item

## Trap Key

Backend kind: `decoy_key`.

Student label: **Trap Key**.

Definition:

```text
A recurring wrong-answer pattern that should be distrusted unless the trigger is actually present.
```

## Trap Key exposure

Show a Trap Key when:

- student selected the decoy;
- unseen and adjacent subgroup miss occurred;
- same repair cell or high connection score;
- selected for Final Sprint;
- manually/coach assigned.

Phrase matching is deferred.

## Key evidence

Keys should be scored.

```yaml
key_evidence:
  key_id:
  question_uid:
  trigger_present: true
  key_action_would_select:
  official_key:
  correct_if_followed:
  exception_flag:
  evidence_type:
```

## Key scoring

```yaml
key_score:
  key_id:
  eligible_count:
  correct_if_followed_count:
  wrong_if_followed_count:
  precision:
  user_expected_gain:
  bank_yield:
  risk_score:
  exception_count:
  final_sprint_rank:
```

## Mnemonics

Mnemonics are not user-editable. Every mnemonic must have a risk note.

## Examples

Examples are tiny recognition objects, not full questions.

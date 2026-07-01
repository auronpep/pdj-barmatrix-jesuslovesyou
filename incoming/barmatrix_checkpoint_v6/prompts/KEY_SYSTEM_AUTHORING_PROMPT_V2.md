# Key / Trap Key Authoring Prompt v2

Author a bank-tested navigational key.

A key must fit:

```text
When you see X,
ask Y,
do Z,
unless W.
```

## Output

```yaml
key_master:
trap_key_profile: # only if render role includes trap_key
examples:
mnemonics:
evidence_notes:
```

## Rules

- Use one backend key library.
- Gold/Silver/Trap/Mnemonic/Example are render roles.
- Trap Key is the student-facing label for backend decoy_key.
- Do not rely on phrase matching unless curated.
- Some keys may use `override_or_exception.status: no_known_override`.

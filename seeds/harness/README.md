# harness/ — the gate's project-side files

Installed by `/harness-setup`. The gate runs automatically after
`/speckit-implement` (see Constitution's guardrails article).

- `constitution-check.sh` — the `contrato` sensor: objective grep checks for
  rules lint/type/test can't catch. **You fill this in** for your project.
- `evaluator-checklist.md` — binary assertions the evaluator confirms on top of
  a green gate (where logic lives, whether tests prove behaviour, etc.).

The gate engine itself lives in the extension
(`.specify/extensions/harness/scripts/`), not here. Configuration is
`harness.config.yml` at the project root (the four sensor commands).

## Running the gate manually

```bash
bash .specify/extensions/harness/scripts/bash/gate.sh        # unix / git bash
pwsh .specify/extensions/harness/scripts/powershell/gate.ps1 # windows
```

Exit 0 = verde, 1 = vermelho, 2 = config faltando.

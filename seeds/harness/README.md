# harness/ — the gate's project-side files

Installed by `/speckit-harness-setup`. The gate runs automatically after
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

Exit 0 = verde, 1 = vermelho, 2 = config faltando. Every sensor is mandatory:
an empty one fails as "não configurado".

## Outside spec-kit (work straight on a branch)

The `after_implement` hook only fires inside `/speckit-implement`. When the team
works directly on feature/fix branches, run the gate **before commit/push** and
in the PR workflow, so the same check applies to everyone:

```yaml
# .github/workflows/pull-request.yml — extra step after checkout + toolchain
      - name: wap-harness gate
        run: bash .specify/extensions/harness/scripts/bash/gate.sh
```

(`.specify/extensions/harness/` must be committed with the project for CI to
find it. In CI the workflow's `setup-java` already sets `JAVA_HOME`; an
`env.JAVA_HOME` path that does not exist on the runner is ignored with a
warning, so a developer's local path does not break the pipeline.)

## Patterns file

The patterns file used by `/speckit-harness-patterns` and the constitution is
`.specify/memory/patterns.md` (setup records here if a different one was kept).

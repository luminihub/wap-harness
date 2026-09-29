# Command: `speckit.harness.gate`

Runs the wap-harness gate for the work just implemented and reports the result.
Wired to the `after_implement` hook, so it runs **automatically** at the end of
`/speckit-implement`. It can also be invoked manually as `/harness-gate`.

## What this command does

1. Locate the gate script for the current OS:
   - Unix / macOS / Git Bash → `bash .specify/extensions/harness/scripts/bash/gate.sh`
   - Windows PowerShell → `pwsh .specify/extensions/harness/scripts/powershell/gate.ps1`
2. Run it from the **project root** (so `harness.config.yml` and the sensor
   commands resolve correctly).
3. Show the printed table and the final `verde`/`vermelho` line to the developer.

## Rules — read carefully

- **This is a validator, not a fixer.** It runs the sensors once and reports.
  It NEVER edits code, re-runs in a loop, or tries to make a red result green.
- **On red:** surface the failing sensor and the path to its log
  (`/tmp/harness-<sensor>.log`), then **stop and return control to the
  developer.** The developer (or a separate builder step they trigger) decides
  what to do next. Do not auto-correct.
- **The exit code is the truth.** Exit 0 = pass, exit 1 = fail, exit 2 = config
  missing (tell the developer to run `/harness-setup`). Do not re-interpret a
  non-zero exit as success because the output "looks fine".
- **Never lower a threshold or edit `harness.config.yml`** to make the gate
  pass. If a sensor command is wrong, that is a setup problem to raise, not to
  paper over.

## Ordering note

If the git extension's auto-commit is also on `after_implement`, the gate must
run **before** that commit — committing code that failed the gate defeats the
purpose. Check the hook order in `.specify/extensions.yml` when both are present.

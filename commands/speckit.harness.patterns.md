# Command: `speckit.harness.patterns`

Fills `docs/patterns.md` by extracting the **real code shapes from this
project's own implemented code**. Run **once**, right after the first
`/speckit-implement` has produced working code. Invoked as `/harness-patterns`.

There is **no argument and no external reference project.** The source is this
project itself. The point is to formalize the patterns that the first feature
established, so every later feature copies them instead of re-inventing.

## Precondition — check first

Look for implemented source under the project's source root (e.g. `src/`,
`app/`, `main/`). "Implemented" means real production code from a completed
feature, not just spec/plan/task markdown.

- **If there is no implemented code yet:** stop and tell the developer:
  *"Sem código pra extrair — rode `/harness-patterns` depois do primeiro
  `/speckit-implement`."* Do not write an empty or guessed `docs/patterns.md`.

## What this command does

1. Read the implemented code of the first feature (services, components/
   modules, types, stores/state, tests — whatever the stack has).
2. Fill each section of `docs/patterns.md` with the **actual shapes found**,
   with short real excerpts from this codebase as the canonical example:
   - module/package anatomy (folder + file layout)
   - service / API-call shape
   - type / interface conventions
   - state management shape (if any)
   - component / unit shape
   - test shape
   - a "recorded pattern decisions" section (start it, note anything notable)
3. Describe what is **actually there** — do not import conventions from another
   project or from general best practice. If the code is inconsistent, record
   the dominant shape and flag the inconsistency rather than inventing a rule.
4. Report the sections filled.

## Rules

- Run once. After this, `docs/patterns.md` is maintained by hand (or re-run
  deliberately) — it is not regenerated on every feature.
- Extract, don't prescribe. This command documents the project's real patterns;
  it does not decide new ones.

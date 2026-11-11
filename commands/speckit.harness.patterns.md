# Command: `speckit.harness.patterns`

Fills the project's patterns file (`.specify/memory/patterns.md`, or the path
recorded in `harness/README.md`) by extracting the **real code shapes from this
project's own implemented code**. Run **once**, right after the first
`/speckit-implement` has produced working code. Invoked as
`/speckit-harness-patterns`.

There is **no argument and no external reference project.** The source is this
project itself. The point is to formalize the patterns that the first feature
established, so every later feature copies them instead of re-inventing.

## Precondition — check first

Look for implemented source under the project's source root (e.g. `src/`,
`app/`, `main/`). "Implemented" means real production code from a completed
feature, not just spec/plan/task markdown.

- **If there is no implemented code yet:** stop and tell the developer:
  *"Sem código pra extrair — rode `/speckit-harness-patterns` depois do primeiro
  `/speckit-implement`."* Do not write an empty or guessed patterns file.
- **If the patterns file already has real content** (not the empty template):
  do not overwrite it. Show the developer what would change and ask.

## What this command does

1. Read the implemented code of the first feature (services, components/
   modules, types, stores/state, tests — whatever the stack has).
2. Fill each section of the patterns file with the **actual shapes found**,
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

- Run once. After this, the patterns file is maintained by hand (or re-run
  deliberately) — it is not regenerated on every feature.
- Extract, don't prescribe. This command documents the project's real patterns;
  it does not decide new ones.

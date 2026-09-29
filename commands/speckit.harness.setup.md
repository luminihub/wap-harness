# Command: `speckit.harness.setup`

Specializes the harness for this project's stack. Run **once**, right after
`specify extension add harness`. Invoked as:

```
/harness-setup --vue      # Vue 3 / TS / Vitest
/harness-setup --kotlin   # Kotlin / Spring Boot / Gradle
/harness-setup --python   # Python / pytest
/harness-setup            # no flag → detect the stack (see below)
```

The extension folder is at `.specify/extensions/harness/`. All source files
referenced below live inside it.

## What this command does

1. **Resolve the stack.**
   - If a flag is given (`--vue` / `--kotlin` / `--python`), use it.
   - If no flag, detect: `package.json` with a `vue` dep → vue;
     `build.gradle` / `build.gradle.kts` → kotlin;
     `pyproject.toml` / `requirements.txt` → python.
   - If detection is ambiguous or finds nothing, ask the developer which stack
     to use. Never guess silently.

2. **Write `harness.config.yml`** at the project root by copying
   `presets/<stack>.yml`. This overwrites the generic `harness.config.yml` that
   `extension add` created from `config-template.yml`. Show the developer the
   four resolved sensor commands and let them confirm/adjust.

3. **Seed the harness files** (only if not already present — never clobber):
   - `seeds/harness/` → `harness/` (`README.md`, `evaluator-checklist.md`,
     `constitution-check.sh`).
   - `seeds/docs/patterns.md` → `docs/patterns.md` (empty template; filled
     later by `/harness-patterns`).

4. **Merge the gate article into the constitution.** Take
   `seeds/constitution-article.md` and add it to
   `.specify/memory/constitution.md` as a new article (or update the existing
   guardrails article to reference `scripts/gate.sh` and
   `harness/evaluator-checklist.md`). Bump the constitution version (MINOR).
   If no constitution exists yet, tell the developer to run
   `/speckit-constitution` first.

5. **`--vue` only — design system.** Copy `assets/design-system.md` →
   `docs/design-system.md`, and record which version was copied (write a
   `<!-- wap-design-system: v<N> -->` stamp at the top, matching the version in
   `assets/design-system.md`). This is a **pinned** copy. It is updated only by
   `/harness-update-design`, never automatically. For `--kotlin` / `--python`,
   skip this step (no UI).

6. **Report** exactly which files were written/changed, and end by telling the
   developer the next steps: run the normal spec-kit cycle; after the first
   `/speckit-implement`, run `/harness-patterns` once.

## Rules

- Never overwrite an existing `harness/`, `docs/patterns.md`, or
  `docs/design-system.md` without telling the developer and getting a yes.
- The four sensor commands come from the preset — do not invent commands for a
  stack that has no preset. If the developer needs a fourth stack, they add a
  `presets/<stack>.yml` first.

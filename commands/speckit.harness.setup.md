# Command: `speckit.harness.setup`

Specializes the harness for this project's stack. Run **once**, right after
`specify extension add harness`. Invoked as:

```
/speckit-harness-setup --vue            # Vue 3 / TS / Vitest
/speckit-harness-setup --react          # React 19 / TS / Vite / Vitest
/speckit-harness-setup --kotlin         # Kotlin / Spring Boot / Gradle
/speckit-harness-setup --kotlin-maven   # Kotlin / Spring Boot / Maven
/speckit-harness-setup --python         # Python / pytest
/speckit-harness-setup                  # no flag → detect the stack (see below)
```

(The command name follows the agent's `invoke_separator` in
`.specify/integration.json`: `/speckit-harness-setup` with `-`,
`/speckit.harness.setup` with `.`. Use the same form when you mention the other
harness commands to the developer.)

The extension folder is at `.specify/extensions/harness/`. All source files
referenced below live inside it.

## What this command does

1. **Resolve the stack.**
   - If a flag is given, use it.
   - If no flag, detect: `package.json` with a `vue` dep → vue;
     `package.json` with a `react` dep → react;
     `pom.xml` → kotlin-maven; `build.gradle` / `build.gradle.kts` → kotlin;
     `pyproject.toml` / `requirements.txt` → python.
   - If detection is ambiguous or finds nothing, ask the developer which stack
     to use. Never guess silently.

2. **Write `harness.config.yml`** at the project root by copying
   `presets/<stack>.yml`. This overwrites the generic `harness.config.yml` that
   `extension add` created from `config-template.yml`. Then **check each sensor
   against what the project really has** before showing it:
   - **vue / react:** read `scripts` in `package.json`. If the preset's script
     name is missing but an equivalent exists, propose the existing one
     (e.g. `typecheck` for `type-check`, `lint` for `lint:check`). If there is no
     test suite yet, **set it up** with the recipe in `seeds/testes/react/`
     (Vitest + Testing Library, versions compatible with the project's Node,
     `test`/`test:watch`/`test:cov` scripts, `npm test` in the PR workflow) and use
     `eval: "npm run test:cov"`. No lint script → set up ESLint the same way.
   - **kotlin-maven:** read `pom.xml`. No `ktlint-maven-plugin` (or detekt) →
     **add it** from `seeds/testes/kotlin-maven/ktlint-plugin.xml` (and run
     `mvn ktlint:format` once, as its own formatting-only commit). No
     `jacoco-maven-plugin` → **add it** from
     `seeds/testes/kotlin-maven/jacoco-plugin.xml` (minimum = current coverage).
     If the project requires a specific JDK
     (`java.version` / `maven.compiler.release` / `kotlin.compiler.jvmTarget` in
     the pom, or a note in CLAUDE.md/README), fill `env.JAVA_HOME`.
   - **kotlin (Gradle):** same checks for `ktlint` / `jacoco` in the build file.
   - Show the developer the four resolved sensor commands (and `env`) and let
     them confirm/adjust. **All four are mandatory:** an empty or `skip` sensor
     fails the gate ("não configurado"), so never leave one blank — set up what
     is missing instead.

3. **Seed the harness files** (only if not already present — never clobber):
   - `seeds/harness/` → `harness/` (`README.md`, `evaluator-checklist.md`,
     `constitution-check.sh`).
   - **Patterns file:** if `.specify/memory/patterns.md` already exists (the
     usual place in WAP projects, referenced by the constitution), use it and
     do not create another one. Otherwise copy `seeds/docs/patterns.md` →
     `.specify/memory/patterns.md`. Record the chosen path in
     `harness/README.md`.

4. **Merge the gate article into the constitution.** Take
   `seeds/constitution-article.md` and add it to
   `.specify/memory/constitution.md` as a new article (or update the existing
   guardrails article to reference the gate script and
   `harness/evaluator-checklist.md`). Bump the constitution version (MINOR).
   If no constitution exists yet, tell the developer to run
   `/speckit-constitution` first.

5. **`--vue` / `--react` only — design system.** First look for a design system
   the project already has (`design.md`, `DESIGN.md`, `docs/design-system.md`,
   `docs/design.md`). If one exists, **do not create another**: tell the
   developer which file was found and compare its stamp
   (`<!-- wap-design-system: v<N> -->`) with `assets/design-system.md`; if it is
   older or has no stamp, ask before replacing it. If none exists, copy
   `assets/design-system.md` → `docs/design-system.md` with the stamp at the top.
   The copy is **pinned**: to update it later, re-run this step deliberately
   (there is no automatic update). For `--kotlin` / `--kotlin-maven` /
   `--python`, skip this step (no UI).

6. **Report** exactly which files were written/changed, and end by telling the
   developer the next steps:
   - the normal spec-kit cycle — the gate runs after `/speckit-implement`;
   - **outside spec-kit** (work straight on a branch): run the gate before
     commit/push — `bash .specify/extensions/harness/scripts/bash/gate.sh` — and
     add it to the PR workflow (see `harness/README.md`);
   - after the first implemented feature, run `/speckit-harness-patterns` once
     (only if the patterns file is still the empty template).

## Rules

- **Coverage is a ratchet.** When a threshold is set (Vitest `thresholds`,
  jacoco `minimum`), start at the project's current coverage, never at a value
  that fails on day one, and never lower it later.

- Never overwrite an existing `harness/`, patterns file or design system without
  telling the developer and getting a yes.
- The four sensor commands come from the preset, adjusted only to commands that
  **already exist in the project** or that this setup installs (step 2). Do not invent commands for
  a stack that has no preset. If the developer needs another stack, they add a
  `presets/<stack>.yml` first.

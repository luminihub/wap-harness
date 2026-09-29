## Article — Automated Gate (wap-harness)

> Merge this into `.specify/memory/constitution.md` as a new article (or fold
> into the existing guardrails article). Bump the constitution version (MINOR).

1. **Sensors are external and binary.** Whether work is correct is decided by
   tools that return 0/1 (the gate: constitution-check, build/type-check, lint,
   tests+coverage), never by the implementing agent's own judgment. An agent
   may not mark work done on the basis of "looks right".

2. **The automated gate is mandatory and the builder never self-approves.** A
   task may not be marked `done` until both are true:
   - the gate exits 0 for that task (`scripts/gate.sh`, i.e.
     `.specify/extensions/harness/scripts/bash/gate.sh`);
   - every applicable item in `harness/evaluator-checklist.md` is checked.
   A task that fails either returns to the builder with the sensor's own output
   as the correction input — never a summary or paraphrase.

3. **Builder and evaluator are separate.** The agent that implements a task is
   not the one that certifies it passed.

4. **The gate is a validator, not a loop.** It runs once after implementation
   and reports. It never auto-corrects, and its thresholds are never lowered to
   force a pass.

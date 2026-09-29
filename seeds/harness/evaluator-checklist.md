# Evaluator Checklist

> Binding on top of a green gate: a task is not `done` until every applicable
> item here is checked. Covers what grep/lint/type-check/tests structurally
> cannot. Each item is a binary assertion — checked or not, never "looks right".
> The **evaluator** checks this, never the agent that wrote the code.
>
> These are stack-neutral starters. Add project-specific items (domain logic
> placement, module rules) as your patterns solidify — mirror them from
> `docs/patterns.md` and the constitution.

## Logic placement

- [ ] The task's business logic (validation, calculation, state transition)
      lives in the module's service/use-case layer, not inline in a UI handler
      or controller.
- [ ] No cross-module access reaches past another module's public boundary
      (its barrel/index/public API) into its internals.

## Tests prove behaviour

- [ ] The task's tests would fail if the behaviour were reverted — they test
      the behaviour, not merely that a function exists or doesn't throw.
- [ ] Tests assert on observable output (return values, emitted events, HTTP
      responses, rendered result), not on private internals.

## Scope

- [ ] The change touches only what the task called for — no unrelated
      refactors, no drive-by edits outside the task's stated scope.

## Consistency with recorded patterns

- [ ] New code follows the shapes recorded in `docs/patterns.md` (folder
      layout, service shape, type/naming conventions). Any deliberate deviation
      is recorded there, not left as silent drift.

---

## Sign-off

Completed by the **evaluator** for task `_____`, not by the agent that
implemented it.

- ☐ all applicable items checked → task may be marked `done`
- ☐ one or more unchecked → returns to the builder with the specific
  unchecked item(s) as feedback

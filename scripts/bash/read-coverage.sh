#!/usr/bin/env bash
# Best-effort coverage extractor (display only).
# v0 handles two JSON shapes:
#   nested (Vitest json-summary):  "<field>": { ... "pct": NN }
#   flat   (Python coverage.json): "<field>": NN   (e.g. percent_covered)
# jacoco XML (Kotlin) is not parsed in v0 — coverage shows blank there;
# the gate's pass/fail is unaffected (gradle owns the threshold).
set -euo pipefail
src="${1:?source file required}"
field="${2:-lines}"

val="$(grep -o "\"${field}\"[[:space:]]*:[[:space:]]*{[^}]*}" "$src" 2>/dev/null \
      | grep -o '"pct"[[:space:]]*:[[:space:]]*[0-9.]*' | head -n1 \
      | grep -o '[0-9.]*$' || true)"

if [[ -z "$val" ]]; then
  val="$(grep -o "\"${field}\"[[:space:]]*:[[:space:]]*[0-9.]*" "$src" 2>/dev/null \
        | head -n1 | grep -o '[0-9.]*$' || true)"
fi

[[ -z "$val" ]] && exit 1
printf '%.0f\n' "$val" 2>/dev/null || echo "$val"

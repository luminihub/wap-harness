#!/usr/bin/env bash
# Best-effort coverage extractor (display only).
# Handles three shapes:
#   nested (Vitest json-summary):  "<field>": { ... "pct": NN }
#   flat   (Python coverage.json): "<field>": NN   (e.g. percent_covered)
#   jacoco CSV (Kotlin/Java):      columns <field>_MISSED / <field>_COVERED
#                                  (e.g. field LINE → LINE_MISSED, LINE_COVERED)
# jacoco XML is not parsed — point `coverage.source` at jacoco.csv instead.
# The gate's pass/fail is unaffected: the eval sensor owns the threshold.
set -euo pipefail
src="${1:?source file required}"
field="${2:-lines}"

if [[ "$src" == *.csv ]]; then
  awk -F, -v f="$field" '
    NR == 1 {
      for (i = 1; i <= NF; i++) {
        if ($i == f "_MISSED") m = i
        if ($i == f "_COVERED") c = i
      }
      next
    }
    m && c { missed += $m; covered += $c }
    END {
      if (!m || !c || missed + covered == 0) exit 1
      printf "%.0f\n", covered * 100 / (missed + covered)
    }' "$src"
  exit $?
fi

val="$(grep -o "\"${field}\"[[:space:]]*:[[:space:]]*{[^}]*}" "$src" 2>/dev/null \
      | grep -o '"pct"[[:space:]]*:[[:space:]]*[0-9.]*' | head -n1 \
      | grep -o '[0-9.]*$' || true)"

if [[ -z "$val" ]]; then
  val="$(grep -o "\"${field}\"[[:space:]]*:[[:space:]]*[0-9.]*" "$src" 2>/dev/null \
        | head -n1 | grep -o '[0-9.]*$' || true)"
fi

[[ -z "$val" ]] && exit 1
printf '%.0f\n' "$val" 2>/dev/null || echo "$val"

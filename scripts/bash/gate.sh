#!/usr/bin/env bash
# wap-harness gate — config-driven sensor runner.
#
# Reads harness.config.yml, runs the four sensors in order, prints a table,
# and exits 0 if all pass or 1 if any fail. Pass/fail is decided SOLELY by
# each sensor's exit code. Coverage % is read for display only, never fatal.
set -euo pipefail

CONFIG="${HARNESS_CONFIG:-harness.config.yml}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -f "$CONFIG" ]]; then
  echo "harness: config não encontrado: $CONFIG" >&2
  echo "rode /harness-setup para criá-lo." >&2
  exit 2
fi

# --- minimal YAML reader for this file's fixed shape ---
# Reads one scalar under a known unique key; strips surrounding quotes/space.
cfg() {
  sed -n "s/^[[:space:]]*$1:[[:space:]]*//p" "$CONFIG" | head -n1 \
    | sed "s/^[\"']//; s/[\"'][[:space:]]*$//; s/[[:space:]]*$//"
}

SENSOR_CONTRATO="$(cfg contrato)"
SENSOR_BUILD="$(cfg build)"
SENSOR_GATE="$(cfg gate)"
SENSOR_EVAL="$(cfg eval)"
COV_SOURCE="$(cfg source)"
COV_FIELD="$(cfg field)"
COV_MIN="$(cfg min)"

run_sensor() {
  local label="$1" cmd="$2" log="/tmp/harness-$1.log"
  if [[ -z "$cmd" ]]; then
    printf '  %-10s —  (não configurado)\n' "$label"
    return 0
  fi
  if eval "$cmd" >"$log" 2>&1; then
    printf '  %-10s ✅ ok\n' "$label"
    return 0
  else
    printf '  %-10s ❌ fail   (log: %s)\n' "$label" "$log"
    return 1
  fi
}

echo "── wap-harness gate ───────────────────────────"
fail=0
run_sensor contrato "$SENSOR_CONTRATO" || fail=1
run_sensor build    "$SENSOR_BUILD"    || fail=1
run_sensor gate     "$SENSOR_GATE"     || fail=1
run_sensor eval     "$SENSOR_EVAL"     || fail=1

# coverage — display only, never changes the exit code
if [[ -n "$COV_SOURCE" && -f "$COV_SOURCE" ]]; then
  cov="$(bash "$HERE/read-coverage.sh" "$COV_SOURCE" "${COV_FIELD:-lines}" 2>/dev/null || true)"
  [[ -n "$cov" ]] && printf '  %-10s %s%% (min %s)\n' "cobertura" "$cov" "${COV_MIN:-—}"
fi

echo "───────────────────────────────────────────────"
if [[ "$fail" -eq 0 ]]; then
  echo "resultado: ✅ verde"
  exit 0
fi
echo "resultado: ❌ vermelho"
exit 1

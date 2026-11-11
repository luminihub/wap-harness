#!/usr/bin/env bash
# wap-harness gate — config-driven sensor runner.
#
# Reads harness.config.yml, runs the four sensors in order, prints a table,
# and exits 0 if all pass or 1 if any fail. Pass/fail is decided SOLELY by
# each sensor's exit code. Coverage % is read for display only, never fatal.
#
# Every sensor is mandatory: an empty (or `skip`) sensor FAILS the gate as
# "não configurado" — a project without build, lint or tests is never green.
set -euo pipefail

CONFIG="${HARNESS_CONFIG:-harness.config.yml}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -f "$CONFIG" ]]; then
  echo "harness: config não encontrado: $CONFIG" >&2
  echo "rode /speckit-harness-setup para criá-lo." >&2
  exit 2
fi

# --- minimal YAML reader for this file's fixed shape ---
# Reads one scalar under a known unique key; strips surrounding quotes/space
# and trailing comments.
unquote() {
  sed "s/[[:space:]]#.*$//; s/^[\"']//; s/[\"'][[:space:]]*$//; s/[[:space:]]*$//"
}
cfg() {
  sed -n "s/^[[:space:]]*$1:[[:space:]]*//p" "$CONFIG" | head -n1 | unquote
}

# --- optional `env:` block: KEY: value lines exported for the sensors ---
# (e.g. JAVA_HOME when the project needs a JDK other than the machine default)
while IFS= read -r line; do
  key="${line%%:*}"; key="${key//[[:space:]]/}"
  val="$(printf '%s' "${line#*:}" | sed 's/^[[:space:]]*//' | unquote)"
  [[ -z "$key" || -z "$val" ]] && continue
  if [[ "$key" == "JAVA_HOME" && ! -d "$val" ]]; then
    echo "harness: env.JAVA_HOME não existe nesta máquina ($val) — mantendo o JDK atual" >&2
    continue
  fi
  export "$key=$val"
done < <(awk '/^env:/{f=1;next} /^[^[:space:]#]/{f=0} f && /^[[:space:]]+[A-Za-z_][A-Za-z0-9_]*:/' "$CONFIG")
if [[ -n "${JAVA_HOME:-}" && -d "$JAVA_HOME/bin" ]]; then
  export PATH="$JAVA_HOME/bin:$PATH"
fi

SENSOR_CONTRATO="$(cfg contrato)"
SENSOR_BUILD="$(cfg build)"
SENSOR_GATE="$(cfg gate)"
SENSOR_EVAL="$(cfg eval)"
COV_SOURCE="$(cfg source)"
COV_FIELD="$(cfg field)"
COV_MIN="$(cfg min)"

LOG_DIR="${TMPDIR:-/tmp}"

run_sensor() {
  local label="$1" cmd="$2" log="$LOG_DIR/harness-$1.log"
  if [[ -z "$cmd" || "$cmd" == "skip" ]]; then
    printf '  %-10s ❌ não configurado (todo sensor é obrigatório — rode /speckit-harness-setup)\n' "$label"
    return 1
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

#!/usr/bin/env bash
# constitution-check — the "contrato" sensor.
#
# Objective (grep-based) checks for constitution rules that lint / type-check /
# tests cannot catch on their own. PROJECT-SPECIFIC: fill in the checks that
# matter for THIS project. Exit 1 on the first violation; exit 0 if clean.
#
# It ships passing (exit 0) so a fresh project is green until you add checks.
set -euo pipefail

fail() { echo "constitution-check: $1" >&2; exit 1; }

# --- examples (uncomment and adapt) ---
#
# Vue: no hardcoded hex colour outside the token file
#   if grep -rEn '#[0-9a-fA-F]{6}' src --include='*.vue' --include='*.scss' \
#        | grep -v 'variables.scss'; then fail "hardcoded hex colour"; fi
#
# TS: no explicit any that slipped past config/comments
#   if grep -rn ': any' src; then fail "explicit any found"; fi
#
# Kotlin: no wildcard imports
#   if grep -rn 'import .*\.\*' src/main; then fail "wildcard import"; fi
#
# Python: no bare 'except:'
#   if grep -rn 'except:' src; then fail "bare except"; fi

# Add project checks above this line.
exit 0

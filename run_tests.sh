#!/usr/bin/env bash
# 樋 toi — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/toi/methods/test_toi_edn.kotoba"
  "test/toi/methods/test_analyze.kotoba"
  "test/toi/methods/test_kotoba.kotoba"
  "test/toi/methods/test_autorun.kotoba"
  "test/toi/methods/test_claim.kotoba"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if kbb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail

#!/usr/bin/env bash
# 樋 toi — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/toi/methods/test_toi_edn.cljc"
  "test/toi/methods/test_analyze.cljc"
  "test/toi/methods/test_kotoba.cljc"
  "test/toi/methods/test_autorun.cljc"
  "test/toi/methods/test_claim.cljc"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if bb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail

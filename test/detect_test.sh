#!/usr/bin/env sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testExitStatus() {
  detect
  assertCapturedSuccess
}

testDetectedName() {
  detect
  assertAppDetected "GNU gettext"
}

#!/usr/bin/env sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testName() {
  detect
  assertCapturedSuccess
  assertCaptured "GNU gettext"
}

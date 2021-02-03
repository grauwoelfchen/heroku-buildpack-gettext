#!/usr/bin/env sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

test_cache_detection() {
  mkdir -p ${CACHE_DIR}/.heroku/gettext/usr/local/bin

  compile

  assertCapturedSuccess
  assertCaptured "GNU gettext is already compiled"
}

test_copy_compiled_binaries_from_cache() {
  mkdir -p ${CACHE_DIR}/.heroku/gettext/usr/local/bin
  touch    ${CACHE_DIR}/.heroku/gettext/usr/local/bin/gettext

  compile

  assertTrue "gettext dir should have been created" \
             "[ -d ${BUILD_DIR}/.heroku/gettext ]"
  assertTrue "gettext command should have been copied" \
             "[ -f ${BUILD_DIR}/.heroku/gettext/usr/local/bin/gettext ]"
}

test_fetch_source_code_from_url() {
  VERSION="0.21"
  URL="https://ftp.gnu.org/pub/gnu/gettext/gettext-${VERSION}.tar.gz"

  compile

  assertCaptured "location: ${URL}"
}

test_copy_soruce_code_from_cache() {
  GETTEXT_VERSION=0.21

  compile

  assertCaptured "location: ${CACHE_DIR}gettext-${GETTEXT_VERSION}.tar.gz"
}

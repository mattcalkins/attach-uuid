#!/usr/bin/env sh

set -eu

echo_header() {
    local text=$1
    # Customize the text rendering here
    echo ""
    echo ""
    echo "---------- $text ----------"
}

TEST_DIRECTORY="/tmp/attach-uuid-test"
rm -rf $TEST_DIRECTORY
mkdir -p $TEST_DIRECTORY


# package
NPM_PACKAGE_DIRECTORY="$TEST_DIRECTORY/attach-uuid-package"
mkdir -p "$NPM_PACKAGE_DIRECTORY"
PACK_FILENAME=$(npm pack)
tar -xzf $PACK_FILENAME -C $NPM_PACKAGE_DIRECTORY --strip-components=1
rm $PACK_FILENAME

pushd $NPM_PACKAGE_DIRECTORY
echo_header "attach-uuid: npm install"
npm install
popd


# CJS Test 1
CJS_TEST_1_DIRECTORY="$TEST_DIRECTORY/cjs-test-1"
mkdir -p "$CJS_TEST_1_DIRECTORY"
mkdir -p "$CJS_TEST_1_DIRECTORY/logs"
cp ./tests/cjs-test-1/package.json "$CJS_TEST_1_DIRECTORY"
cp ./tests/cjs-test-1/cjs-test-1.cjs "$CJS_TEST_1_DIRECTORY"

pushd $CJS_TEST_1_DIRECTORY > /dev/null
echo_header "cjs-test-1: npm update"
npm update
echo_header "cjs-test-1: node cjs-test-1.cjs"
node cjs-test-1.cjs
popd > /dev/null


# ESM Test 1
ESM_TEST_1_DIRECTORY="$TEST_DIRECTORY/esm-test-1"
mkdir -p "$ESM_TEST_1_DIRECTORY"
mkdir -p "$ESM_TEST_1_DIRECTORY/logs"
cp ./tests/esm-test-1/package.json "$ESM_TEST_1_DIRECTORY"
cp ./tests/esm-test-1/esm-test-1.mjs "$ESM_TEST_1_DIRECTORY"

pushd $ESM_TEST_1_DIRECTORY > /dev/null
echo_header "esm-test-1: npm update"
npm update
echo_header "esm-test-1: node esm-test-1.mjs"
node esm-test-1.mjs
popd > /dev/null


# Complete
echo_header "test.sh: all test completed"

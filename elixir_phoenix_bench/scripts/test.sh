#!/bin/sh

uname -a

TARGET_DIR=$(pwd)/test-artifacts

cd "$1"
echo "$2"
echo 'Fetch deps, compile and run unit tests'
mix do deps.get, deps.compile, test --env=prod --verbose
echo 'Success!'

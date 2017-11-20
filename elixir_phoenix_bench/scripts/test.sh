#!/bin/sh
set -e -x

TARGET_DIR=$(pwd)/test-artifacts
export DATABASE_URL=ecto://phx_test_user:pass123@meluhha-postgresql/phx_bench_api_test

cd "$1"
echo "$2"
echo 'Fetch deps, compile and run unit tests'
env MIX_ENV=test mix do deps.get, deps.compile, test
echo 'Success!'

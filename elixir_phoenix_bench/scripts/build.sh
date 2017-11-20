#!/bin/sh
set -e -x

uname -a
ls

export MIX_ENV=prod

TARGET_DIR=$(pwd)/build-artifact
VERSION=$(cat version/number)
REL_DIR="_build/$MIX_ENV/rel/phx_bench_api/releases/$VERSION"
OUTPUT_ARTIFACT="$REL_DIR/phx_bench_api.tar.gz"


cd "$*"
echo 'Fetch deps, compile & prod release build...'
mix do deps.get, deps.compile, release
cp Dockerfile $TARGET_DIR
cp $OUTPUT_ARTIFACT $TARGET_DIR
ls $TARGET_DIR
echo 'Success!'

#!/bin/sh

uname -a

TARGET_DIR=$(pwd)/rel-artifacts
VERSION="0.0.1"
REL_DIR="_build/dev/rel/phx_bench_api/releases/$VERSION"
OUTPUT_ARTIFACT="$REL_DIR/phx_bench_api.tar.gz"

cd "$*"
echo 'Fetch deps, compile, test & release build...'
mix do deps.get, deps.compile, release --env=prod --verbose
cp Dockerfile $TARGET_DIR
cp "_build/dev/rel/phx_bench_api/releases/$VERSION/phx_bench_api.tar.gz" $TARGET_DIR
ls $TARGET_DIR
echo 'Success!'

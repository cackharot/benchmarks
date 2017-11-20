#!/bin/sh
set -e -x

uname -a
ls
cp -r version "$*"

export MIX_ENV=prod

TARGET_DIR=$(pwd)/build-artifact
VERSION=$(cat version/number)
REL_DIR="_build/$MIX_ENV/rel/phx_bench_api/releases/$VERSION"
SRC_ARTIFACT="$REL_DIR/phx_bench_api.tar.gz"
OUTPUT_ARTIFACT="$TARGET_DIR/phx_bench_api-$VERSION.tar.gz"


cd "$*"
echo 'Fetch deps, compile & prod release build...'
# mix do deps.get, deps.compile, release
cp Dockerfile $TARGET_DIR
mkdir -p $REL_DIR
touch $OUTPUT_ARTIFACT
cp $SRC_ARTIFACT $OUTPUT_ARTIFACT
ls $TARGET_DIR
echo 'Success!'

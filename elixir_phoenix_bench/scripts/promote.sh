#!/bin/sh
set -e -x

VERSION=$(cat version/number)
TARGET_DIR=$(pwd)/promote-to-final
SRC_ARTIFACT="$*/phx_bench_api-*.tar.gz"
OUTPUT_ARTIFACT="$TARGET_DIR/phx_bench_api-$VERSION.tar.gz"

cp -r version $TARGET_DIR
cp "$*/Dockerfile" $TARGET_DIR
cp $SRC_ARTIFACT $OUTPUT_ARTIFACT

ls $TARGET_DIR
echo 'Success!'

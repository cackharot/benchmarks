#!/bin/sh
set -e -x
ls -ltr

VERSION=$(cat version/number)
TARGET_DIR=$(pwd)/promote-to-final
SRC_ARTIFACT="$2/phx_bench_api-*.tar.gz"
OUTPUT_ARTIFACT="$TARGET_DIR/phx_bench_api-$VERSION.tar.gz"

cp -r version $TARGET_DIR
cp "$1/Dockerfile" $TARGET_DIR
cp $SRC_ARTIFACT $OUTPUT_ARTIFACT

ls -ltr $TARGET_DIR
echo 'Success!'

#!/bin/sh
set -e -x

uname -a
ls
ls version/*
cat version/number
TARGET_DIR=$(pwd)/build-artifact
VERSION="0.0.1"
REL_DIR="_build/dev/rel/phx_bench_api/releases/$VERSION"
OUTPUT_ARTIFACT="$REL_DIR/phx_bench_api.tar.gz"

export DATABASE_URL=ecto://phx_prod_user:pass123@meluhha-postgresql/phx_bench_api_prod

cd "$*"
echo 'Fetch deps, compile, test & release build...'
mix do deps.get, deps.compile, release --env=prod --verbose
cp Dockerfile $TARGET_DIR
cp "_build/dev/rel/phx_bench_api/releases/$VERSION/phx_bench_api.tar.gz" $TARGET_DIR
echo $TARGET_DIR
ls $TARGET_DIR
echo 'Success!'

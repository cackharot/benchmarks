#!/bin/bash

env MIX_ENV=prod mix do deps.get, compile, release, ecto.create, ecto.migrate && \
  env PORT=4001 rel/phx_bench_api/bin/phx_bench_api foreground
# mix deps.get --only prod \
#   && env MIX_ENV=prod mix compile \
#   && env MIX_ENV=prod mix ecto.create \
#   && env MIX_ENV=prod mix ecto.migrate \
#   && env MIX_ENV=prod mix phx.digest \
#   && env PORT=4001 MIX_ENV=prod mix phx.server \
# #  && env MIX_ENV=prod PORT=4001 elixir --detached -S mix do compile, phoenix.server


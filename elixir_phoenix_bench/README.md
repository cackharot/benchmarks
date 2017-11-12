# PhxBenchApi

Tests the below api's

* /api/todos - fetches all todos from postgres db
* /api/add?a=1&b=3 - calculates the additon of a,b query params and returns the sum
* /api/raw - returns "Welcome!" string

### Requirements
* brew install elixir

To start the app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`


### Smoke test the API
```
curl http://localhost:4001/api/todos

curl -H'Content-Type: application/vnd.api+json' -d'{"todo":{"description":"item 1","complete":false}}' http://localhost:4001/api/todos

curl -H'Content-Type: application/vnd.api+json' -d'{"a":1,"b":4}' http://localhost:4001/api/sum

curl http://localhost:4001/api/raw
```

### Benchmark

Start the app in the production mode.

Create the config/prod.secret.exs
```
use Mix.Config

config :phx_bench_api, PhxBenchApi.Endpoint,
  secret_key_base: "YnwTjGRrkzfqaogjnlkfPI9EQwpBZJjyHWsyRQ1V0ScasSimCz3ET/xQ1nEh7IJB"

# Configure your database
config :phx_bench_api, PhxBenchApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "<username>",
  password: "<password>",
  database: "phx_bench_api_prod",
  pool_size: 15
```

Then run
```
env MIX_ENV=prod mix do deps.get, compile, release, ecto.create, ecto.migrate && \
  env PORT=4001 rel/phx_bench_api/bin/phx_bench_api foreground
```

* Fetch todos
```
wrk -t12 -c12 -d10s http://localhost:4001/api/todos
```

* Create todos
```
wrk -t12 -c12 -d10s --latency -s wrk_scripts/create_todo.lua http://localhost:4001/api/todos
```

* Calculate sum
```
wrk -t12 -c12 -d10s --latency -s wrk_scripts/sum.lua http://localhost:4001/api/sum
```

* Raw
```
wrk -t12 -c12 -d10s http://localhost:4001/api/raw
```


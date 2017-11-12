# Phoenix Benchmark

Tests the below api's

* /api/todos - fetches all todos from postgres db
* /api/sum?a=1&b=3 - calculates the additon of a,b params and returns the sum
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
  pool_size: 50
```

Then run
```
env MIX_ENV=prod mix do deps.get, compile, release, ecto.create, ecto.migrate && \
  env PORT=4001 rel/phx_bench_api/bin/phx_bench_api foreground
```

### Results

* Fetch todos
```
wrk -t12 -c12 -d10s  --latency http://localhost:4001/api/todos
```
```
Running 10s test @ http://localhost:4001/api/todos
  12 threads and 12 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.58ms  620.19us  12.61ms   78.44%
    Req/Sec   389.76     34.38   630.00     79.34%
  Latency Distribution
     50%    2.51ms
     75%    2.85ms
     90%    3.24ms
     99%    4.59ms
  46777 requests in 10.10s, 16.33MB read
Requests/sec:   4629.81
Transfer/sec:      1.62MB
```

* Calculate sum
```
wrk -t12 -c12 -d10s --latency -s wrk_scripts/sum.lua http://localhost:4001/api/sum
```
```
Running 10s test @ http://localhost:4001/api/sum
  12 threads and 12 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   637.94us  208.81us   8.99ms   80.97%
    Req/Sec     1.54k    90.98     1.76k    62.79%
  Latency Distribution
     50%  629.00us
     75%  736.00us
     90%  840.00us
     99%    1.05ms
  185964 requests in 10.10s, 44.43MB read
Requests/sec:  18410.60
Transfer/sec:      4.40MB
```

* Raw
```
wrk -t12 -c12 -d10s --latency http://localhost:4001/api/raw
```
```
Running 10s test @ http://localhost:4001/api/raw
  12 threads and 12 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   398.12us  103.05us   1.78ms   70.36%
    Req/Sec     2.50k   193.31     2.94k    68.32%
  Latency Distribution
     50%  390.00us
     75%  458.00us
     90%  531.00us
     99%  688.00us
  301595 requests in 10.10s, 69.03MB read
Requests/sec:  29861.83
Transfer/sec:      6.83MB
```



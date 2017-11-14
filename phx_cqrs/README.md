# Sample Eventsourcing/CQRS apps in Elixir

This repo severs as a reference for building Eventsourcing/CQRS apps in Elixir.

This is an umberlla mix project containing

* commands - commands structs definition only, no business logic
* events - domain events structs definition only, no business logic
* middlewares - middleware components e.g, web plugs
* projections - read model database schema, repo, migrations, etc.,
* todos - Core domain application contains aggregates, command handler, router, event handlers etc.,
* web - REST API endpoints to dispatch commands and query read models, etc.,

### Requirements

* Erlang
* Elixir
* Postgres

### Setup & run

Confgiure the postgres db connection details in `apps/todos/config/{test,dev}.exs` (both eventstore and todos repo)

Then execute the below commands in order

```
mix deps.get
mix test
```
Execute web app `mix phx.server`

### Testing API

Create sample todo list
```
curl -H'Content-Type: application/vnd.api+json' -d'{"todo":{"description":"sample todo list 1"}}' http://localhost:4000/api/todos
```

Fetch all todo list
```
curl http://localhost:4000/api/todos
```

### Reset database

```
env MIX_ENV=test mix do event_store.drop, ecto.drop, event_store.create, event_store.init, ecto.create, ecto.migrate
env MIX_ENV=dev mix do event_store.drop, ecto.drop, event_store.create, event_store.init, ecto.create, ecto.migrate
```

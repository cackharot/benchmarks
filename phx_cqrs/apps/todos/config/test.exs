use Mix.Config

config :eventstore, EventStore.Storage,
    serializer: Commanded.Serialization.JsonSerializer,
    username: "postgres",
    password: "pass123",
    database: "phx_cqrs_eventstore_test",
    hostname: "localhost",
    pool_overflow: 5

# Configure your projections database
config :todos, PhxCqrs.Todos.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: "postgres",
    password: "pass123",
    database: "phx_cqrs_todos_projections_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox

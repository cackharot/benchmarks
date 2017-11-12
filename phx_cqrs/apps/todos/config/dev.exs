use Mix.Config

config :eventstore, EventStore.Storage,
    serializer: Commanded.Serialization.JsonSerializer,
    username: "postgres",
    password: "pass123",
    database: "phx_cqrs_eventstore_dev",
    hostname: "localhost",
    pool_size: 10,
    pool_overflow: 5

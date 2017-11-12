# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_bench_api,
  ecto_repos: [PhxBenchApi.Repo]

# Configures the endpoint
config :phx_bench_api, PhxBenchApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9FRsSbRwTpcOSqRE1MOoKKIO6is7/AUZ4MALM0NzoH2EZmOUykTdSSa9BpUT3d7Q",
  render_errors: [view: PhxBenchApi.ErrorView, accepts: ~w(json json-api)],
  pubsub: [name: PhxBenchApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders, "json-api": Poison

config :mime, :types, %{"application/vnd.api+json" => ["json-api"]}

config :phoenix, PhoenixExample.Endpoint,
  render_errors: [view: PhoenixExample.ErrorView, accepts: ~w(html json json-api)]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

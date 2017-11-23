# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sample_oauth2,
  ecto_repos: [SampleOauth2.Repo]

config :oauth2, serializers: %{
    "application/vnd.api+json" => Poison,
    "application/json" => Poison,
  },
  debug: true

# Configures the endpoint
config :sample_oauth2, SampleOauth2.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qdDAffTK9dMOAIBztQDF3GaUQbCK4xgFj72+51ySP4p6XqvWGakWD2BAMYkebif8",
  render_errors: [view: SampleOauth2.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SampleOauth2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :data_rest_elixir,
  ecto_repos: [DataRestElixir.Repo]

# Configures the endpoint
config :data_rest_elixir, DataRestElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6BeToLlPh1Ayjsf96W+Crno+9mpYPAzuv4rYqiGcsa0nNL0x+FTH12x4/sg4hNqL",
  render_errors: [view: DataRestElixirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DataRestElixir.PubSub,
  live_view: [signing_salt: "zYj0ay+Q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

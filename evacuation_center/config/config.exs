# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :evacuation_center,
  ecto_repos: [EvacuationCenter.Repo]

# Configures the endpoint
config :evacuation_center, EvacuationCenterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uNpH8ZCVSUwjWoY8vknYiBPbZjxQO9INnc9WDiZydZs8pX0Nq/U4G3rCsykUMTYs",
  render_errors: [view: EvacuationCenterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EvacuationCenter.PubSub,
  live_view: [signing_salt: "mSrlah1c"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

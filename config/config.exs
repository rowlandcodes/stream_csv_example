# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :stream_csv,
  ecto_repos: [StreamCsv.Repo]

# Configures the endpoint
config :stream_csv, StreamCsvWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: StreamCsvWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: StreamCsv.PubSub,
  # uncomment to use Bandit instead of PlugCowboy as a Plug adapter
  # adapter: Bandit.PhoenixAdapter,
  live_view: [signing_salt: "mbkEyRcC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

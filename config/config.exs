# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :breadapp,
  ecto_repos: [Breadapp.Repo]

# Configures the endpoint
config :breadapp, Breadapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cyxE8zPGwZK5ibs+O+uLBcfO/+Wa3vRCPLpxaYGsb3L/G1RPKtkCZttpBG7PwSEb",
  render_errors: [view: Breadapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Breadapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [default_scope: "user,public_repo"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "37d5675de3661da83a3c",
  client_secret: "99cb01c31187c30920ac702721cf9e24079d7b8d"

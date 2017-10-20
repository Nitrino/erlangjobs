# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :erlangjobs, ErlangjobsWeb.Gettext,
  locales: ~w(ru en),
  default_locale: "ru"

config :hound, driver: "chrome_driver"

config :erlangjobs, BasicAuth, username: System.get_env("JOBS_ADMIN"), password: System.get_env("JOBS_PASSWORD")

# General application configuration
config :erlangjobs,
  ecto_repos: [Erlangjobs.Repo]

# Configures the endpoint
config :erlangjobs, ErlangjobsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cNG/+4Ux4N7WF3IAlGhLYvaTU+YY6L8BVQRdA66pYwg7wC3eyTyGanmlAlC3Ww5X",
  render_errors: [view: ErlangjobsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Erlangjobs.PubSub,
           adapter: Phoenix.PubSub.PG2]
           
config :erlangjobs, Erlangjobs.Twitter,
  client: ExTwitter

config :extwitter, :oauth, [
   consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
   consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
   access_token: System.get_env("TWITTER_ACCESS_TOKEN"),
   access_token_secret: System.get_env("TWITTER_ACCESS_TOKEN_SECRET")
]
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :scrivener_html,
  routes_helper: ErlangjobsWeb.Router.Helpers,
  view_style: :bootstrap_v4

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

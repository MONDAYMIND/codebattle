import Config

port = System.get_env("CODEBATTLE_PORT", "4000")
host = System.get_env("CODEBATTLE_HOSTNAME", "codebattle.hexlet.io")
secret_key_base = System.get_env("CODEBATTLE_SECRET_KEY_BASE")
live_view_salt = System.get_env("CODEBATTLE_LIVE_VIEW_SALT")

config :codebattle, CodebattleWeb.Endpoint,
  http: [:inet6, port: port],
  url: [host: host, port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: secret_key_base,
  live_view: [signing_salt: live_view_salt],
  server: true

config :codebattle, host: host

config :codebattle, Codebattle.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("CODEBATTLE_DB_NAME"),
  ssl: true,
  port: System.get_env("CODEBATTLE_DB_PORT", "5432"),
  username: System.get_env("CODEBATTLE_DB_USERNAME"),
  password: System.get_env("CODEBATTLE_DB_PASSWORD"),
  database: System.get_env("CODEBATTLE_DB_NAME"),
  hostname: System.get_env("CODEBATTLE_DB_HOSTNAME"),
  pool_size: 7

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Discord.OAuth,
  client_id: System.get_env("DISCORD_CLIENT_ID"),
  client_secret: System.get_env("DISCORD_CLIENT_SECRET")

config :codebattle, Codebattle.Plugs, rollbar_api_key: System.get_env("ROLLBAR_API_KEY")

config :codebattle, :firebase,
  sender_id: System.get_env("FIREBASE_SENDER_ID"),
  api_key: System.get_env("FIREBASE_API_KEY"),
  firebase_autn_url: "https://identitytoolkit.googleapis.com/v1/accounts"

config :sentry,
  dsn: System.get_env("SENTRY_DNS_URL"),
  environment_name: :prod,
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{env: "prod"},
  included_environments: [:prod]

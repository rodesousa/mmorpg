use Mix.Config

config :mmorpg, Mmorpg.Repo,
  database: "mmorpg_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :mmorpg, ecto_repos: [Mmorpg.Repo]

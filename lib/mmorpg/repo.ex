defmodule Mmorpg.Repo do
  use Ecto.Repo,
    otp_app: :mmorpg,
    adapter: Ecto.Adapters.Postgres
end

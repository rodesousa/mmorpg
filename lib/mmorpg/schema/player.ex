defmodule Mmorpg.Schema.Player do
  use Ecto.Schema
  import Ecto.Query

  schema "player" do
    field(:name, :string)
    field(:password, :string)
    has_many(:characters, Mmorpg.Schema.Character)
  end

  def get_player(name) do
    from(p in Player, select: p.name, where: p.name == ^name)
    |> Repo.one!()
  end

  def get_player(name, password) do
    from(p in Player, select: p.name, where: p.name == ^name, where: p.password == ^password)
    |> Repo.one!()
  end
end

defmodule Mmorpg.Schema.Player do
  @moduledoc """
  Player Schema
  """
  use Ecto.Schema
  import Ecto.Query

  schema "player" do
    field(:name, :string)
    field(:password, :string)
    has_many(:characters, Mmorpg.Schema.Character)
  end

  def get_player(name) do
    from(p in __MODULE__, where: p.name == ^name)
  end

  def get_player(name, password) do
    from(p in __MODULE__, select: p.name, where: p.name == ^name, where: p.password == ^password)
  end
end

defmodule Mmorpg.Schema.Character do
  use Ecto.Schema
  import Ecto.Query

  schema "character" do
    field(:name, :string)
    field(:patern, :string)
    field(:stamina, :integer)
    field(:atk, :integer)
    field(:vit, :integer)
    field(:defense, :integer)
    field(:moves, :map)
    field(:buffs, :map)
    belongs_to(:player, Mmorpg.Schema.Player)
  end

  def character(:def, name) do
    %__MODULE__{
      name: name,
      stamina: 10,
      atk: 4,
      vit: 5,
      defense: 2,
      patern: :def
    }
  end

  def character(:off, name) do
    %__MODULE__{
      name: name,
      stamina: 10,
      atk: 3,
      vit: 5,
      defense: 3,
      patern: :off
    }
  end

  @doc """
  returns characters by a player
  """
  @spec get_characters(Mmorpg.Schema.Player.t()) :: list
  def get_characters(%{id: id}) do
    from(
      c in Character,
      join: p in assoc(c, :player),
      where: p.id == ^id,
      preload: [players: p]
    )
  end
end

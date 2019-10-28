defmodule Mmorpg.Schema.Character do
  use Ecto.Schema

  schema "character" do
    field(:name, :string)
    field(:patern, :string)
    field(:stamina, :integer)
    field(:atk, :integer)
    field(:vit, :integer)
    field(:def, :integer)
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

  def character(_) do
    IO.puts("Pas le temps pour les blagues")
    System.halt(0)
  end
end

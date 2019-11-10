defmodule Mmorpg.Controller.Character do
  alias Mmorpg.Schema.Character, as: SchemaCharacter
  alias Mmorpg.Schema.Player
  alias Mmorpg.Repo

  def create_character(patern, name) do
    patern
    |> Character.character(name)
    |> Repo.insert()
  end

  # @spec choosse_or_create_character(Player.t()) :: SchemaCharacter.t()
  def choosse_or_create_character(player) do
  end
end

defmodule Mmorpg.Controller.Character do
  alias Mmorpg.Schema.Character, as: SchemaCharacter
  alias Mmorpg.Schema.Player
  alias Mmorpg.Repo

  def create_character(patern, name, player_id) do
    character =
      patern
      |> SchemaCharacter.character(name)

    %{character | player: player_id}
    |> Repo.insert()
  end

  def choosse_or_create_character(player) do
  end
end

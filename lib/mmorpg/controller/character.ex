defmodule Mmorpg.Controller.Character do
  @moduledoc """
  Controller Character

  All of actions about Character have to pass here
  """

  alias Mmorpg.Model.Character, as: ModelCharacter
  alias Mmorpg.Repo

  @doc """
  Creates a Character
  """
  @spec create(atom, String.t(), Mmorpg.Schema.Player.t()) :: String.t()
  def create(patern, name, %{id: id} = player) do
    character =
      patern
      |> get_character(name)

    ModelCharacter.get_characters(player)
    |> Repo.one()
    |> case do
      nil ->
        %{character | player_id: id}
        |> Repo.insert()

      error ->
        error
    end
  end

  defp get_character(:def, name) do
    %ModelCharacter{
      name: name,
      stamina: 10,
      atk: 4,
      vit: 5,
      defense: 2,
      patern: "def"
    }
  end

  defp get_character(:off, name) do
    %ModelCharacter{
      name: name,
      stamina: 10,
      atk: 3,
      vit: 5,
      defense: 3,
      patern: "off"
    }
  end
end

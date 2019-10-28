defmodule Mmorpg.Controller.Character do
  alias Mmorpg.Schema.Character
  alias Mmorpg.Repo

  def create_character(patern, name) do
    patern
    |> Character.character(name)
    |> Repo.insert()
  end
end

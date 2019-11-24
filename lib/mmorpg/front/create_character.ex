defmodule Mmorpg.Front.CreateCharacter do
  alias Mmorpg.Controller.Character

  def display(player_id) do
    with name <- IO.gets("Nom du perso ? "),
         patern <-
           IO.gets("""
           patern du perso ?
           1- Offensive
           2- Défensive
           """) do
      patern
      |> Character.create_character(name, player_id)
    end
  end
end

defmodule Mmorpg.Front.CreateCharacter do
  alias Mmorpg.Controller.Character

  def display() do
    with name <- IO.gets("Nom du perso ? "),
         patern <-
           IO.gets("""
           patern du perso ?
           1- Offensive
           2- Défensive
           """) do
      patern
      |> Character.create_character(name)
    end
  end
end

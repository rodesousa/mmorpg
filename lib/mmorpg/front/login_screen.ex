defmodule Mmorpg.Front.LoginScreen do
  alias Mmorpg.Controller.Player
  import Ecto.Query

  def display() do
    IO.gets("""
    1- Deja compte ?
    2- Nouveau ?
    """)
    |> String.trim("\n")
    |> case do
      1 ->
        Player.begining(:signin)
        |> Player.choosse_or_create_character()

      2 ->
        Player.begining(:create)
        |> Player.choosse_or_create_character()

      _ ->
        IO.puts("FUCK !")
    end
  end
end

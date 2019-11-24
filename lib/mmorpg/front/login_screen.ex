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
        sign_create_player(:signin)

      # |> Player.choosse_or_create_character()

      2 ->
        sign_create_player(:create)

      # |> Player.choosse_or_create_character()

      _ ->
        IO.puts("FUCK !")
    end
  end

  def sign_create_player(type) do
    {login, password} = ask_login
    Player.get_player(type)
  end

  defp ask_login() do
    login =
      IO.gets("Login: ")
      |> String.trim("\n")

    password =
      Mix.Tasks.Hex.password_get("Password: ")
      |> String.trim("\n")

    {login, password}
  end
end

defmodule Mmorpg.Front.LoginScreen do
  alias Mmorpg.Schema.Player
  alias Mmorpg.Repo
  import Ecto.Query

  def display() do
    IO.gets("""
    1- Deja compte ?
    2- Nouveau ?
    """)
    |> String.trim("\n")
    |> case do
      1 ->
        begining(:signin)

      2 ->
        begining(:create)

      _ ->
        IO.puts("FUCK !")
    end
  end

  def get_login_password do
    login =
      IO.gets("Login: ")
      |> String.trim("\n")

    password =
      Mix.Tasks.Hex.password_get("Password: ")
      |> String.trim("\n")

    {login, password}
  end

  # deja un acompte
  defp begining(:signin) do
    with {name, password} <- get_login_password,
         player <- get_player(name) do
      player
      |> Enum.empty?()
      |> case do
        true ->
          IO.puts("login/mot de passe faux !")

        false ->
          IO.puts("Let's go #{Enum.fetch!(player, 0).name}")
      end
    end
  end

  # nouveau
  defp begining(:create) do
    {login, password} = get_login_password

    login
    |> get_player()
    |> Enum.empty?()
    |> case do
      true ->
        %Player{name: login, password: password}
        |> Repo.insert()

      false ->
        IO.puts("Il y a deja un compte avec #{login}")
    end

    :ignore
  end

  def get_player(name) do
    from(p in Player, select: p.name, where: p.name == ^name)
    |> Repo.one!()
  end

  def get_player(name, password) do
    from(p in Player, select: p.name, where: p.name == ^name, where: p.password == ^password)
    |> Repo.one!()
  end
end

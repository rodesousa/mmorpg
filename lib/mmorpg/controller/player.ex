defmodule Mmorpg.Controller.Player do
  alias Mmorpg.Repo
  alias Mmorpg.Schema.Player, as: SchemaPlayer

  @doc """
  player signin
  """
  def begining(:signin) do
    with {name, password} <- get_login_password,
         player <- Player.get_player(name) do
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

  @doc """
  New player
  """
  def begining(:create) do
    {login, password} = get_login_password

    login
    |> Player.get_player()
    |> Enum.empty?()
    |> case do
      true ->
        %SchemaPlayer{name: login, password: password}
        |> Repo.insert()

      false ->
        IO.puts("Il y a deja un compte avec #{login}")
    end
  end

  defp get_login_password do
    login =
      IO.gets("Login: ")
      |> String.trim("\n")

    password =
      Mix.Tasks.Hex.password_get("Password: ")
      |> String.trim("\n")

    {login, password}
  end
end

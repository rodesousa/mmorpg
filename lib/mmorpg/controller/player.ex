defmodule Mmorpg.Controller.Player do
  @moduledoc """
  Controller Player

  All of actions about Player have to pass here
  """
  alias Mmorpg.Repo
  alias Mmorpg.Schema.Player

  @doc """
  player signin
  """
  @spec get_player(atom, String.t(), String.t()) :: {:ok | :error, String.t()}
  def get_player(:signin, name, password) do
    player =
      Player.get_player(name)
      |> Repo.one()

    player
    |> case do
      nil -> {:error, "login/mot de passe faux !"}
      player -> {:ok, player}
    end
  end

  @doc """
  New player
  """
  def get_player(:create, name, password) do
    name
    |> Player.get_player()
    |> Repo.one()
    |> case do
      nil ->
        %Player{name: name, password: password}
        |> Repo.insert()

        {:ok, "Player #{name} est crée"}

      _ ->
        {:error, "Il y a deja un compte avec #{name}"}
    end
  end
end

defmodule Mmorpg.Controller.Player do
  @moduledoc """
  Controller Player

  All of actions about Player have to pass here
  If u prefere, it's a reverse proxy between Model <-> View
  """
  alias Mmorpg.Repo
  alias Mmorpg.Schema.Player, as: SchemaPlayer

  @doc """
  player signin
  """
  @spec get_player(atom, String.t(), String.t()) :: {:ok | :error, String.t()}
  def get_player(:signin, name, password) do
    player = SchemaPlayer.get_player(name)

    player
    |> Enum.empty?()
    |> case do
      true -> {:error, "login/mot de passe faux !"}
      false -> {:ok, "Let's go #{Enum.fetch!(player, 0).name}"}
    end
  end

  @doc """
  New player
  """
  def get_player(:create, name, password) do
    name
    |> SchemaPlayer.get_player()
    |> case do
      nil ->
        %SchemaPlayer{name: name, password: password}
        |> Repo.insert()

        {:ok, "Player #{name} est crée"}

      _ ->
        {:error, "Il y a deja un compte avec #{name}"}
    end
  end
end

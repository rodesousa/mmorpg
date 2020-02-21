defmodule Mmorpg.Controller.Fight.Strategy do
  @moduledoc """
  A strategy is the set of `fight action` with his chances of counter for any type of fight action

  Each strategy must have a `:default` when a player don't know what he have to do

  Example: For a player, we can say there is 80% to use `defense` against a atack and 20% to use `atack`. That's the same for every other action except counter. As he doesn't know, per default he atacks !
  """

  # defstruct [
  # :atk,
  # :overhead,
  # :feint,
  # :defense,
  # :dodge,
  # :counter,
  # :default
  # ]
  alias Mmorpg.Model.Fight.Action.{Atack, Defense}

  @doc """
  Gets randomly an action between strategy
  """
  @spec choose_action(Map.t()) :: String.t()
  def choose_action(strategy) do
    rand = Enum.random(1..100)

    strategy
    |> Enum.reduce_while(%Defense{}, fn {key, value}, acc ->
      if rand <= value.chance do
        {:halt, value.action}
      else
        {:cont, acc}
      end
    end)
  end

  @doc false
  @spec default_strategy() :: Map.t()
  def default_strategy(),
    do: %{
      atak: %{chance: 50, action: %Atack{}},
      def: %{chance: 50, action: %Defense{}}
    }
end

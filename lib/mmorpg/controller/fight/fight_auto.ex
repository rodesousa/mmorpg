defmodule Mmorpg.Controller.Fight.FightAuto do
  @moduledoc """
  When 2 non-humans enemies fight
  """
  use Opus.Pipeline
  alias Mmorpg.Controller.Protocols.Alive
  alias Mmorpg.Controller.Fight.Strategy
  alias Mmorpg.Model.Fight.Action
  alias Mmorpg.Model.Fight.Status
  require Mmorpg.Model.Fight.Action.Family, as: Family

  @type fighter :: %{character: %Mmorpg.Model.Character{}, status: %Status{}}

  check(:alives?)
  step(:select_order)
  step(:choose_action)
  step(:buff)
  step(:resolve_action)
  # step(:continue_or_end)
  # link(Mmorpg.Controller.Fight.FightAuto)

  @doc """
  Each Character impletems the alive behavior
  It checks if a character is alive
  """
  @spec alives?({fighter, fighter}) :: bool()
  def alives?({%{character: p1}, %{character: p2}}) do
    [p1, p2]
    |> Enum.reduce_while(
      true,
      fn alive, _ ->
        if Alive.alive?(alive) do
          {:cont, true}
        else
          {:halt, false}
        end
      end
    )
  end

  @doc """
  Determines who begins the first action
  """
  @spec select_order({fighter, fighter}) :: {fighter, fighter}
  def select_order({f1 = %{status: s1}, f2 = %{status: s2}}) do
    cond do
      s1.fighting_order == :first or s2.fighting_order == :last -> {f1, f2}
      s1.fighting_order == :last or s2.fighting_order == :first -> {f2, f1}
      true -> Enum.shuffle([f1, f2]) |> List.to_tuple()
    end
  end

  @doc """
  Chooses action for f1 and f2

  For now there is only 2 players, i have to think about multi players.

  """
  @spec choose_action({fighter, fighter}) :: {fighter, fighter}
  def choose_action({f1, f2}) do
    with f1 <- evaluate({f1, f2}),
         f2 <- evaluate({f2, f1}) do
      {f1, f2}
    end
  end

  @spec evaluate({fighter, fighter}) :: fighter

  defp evaluate({f1 = %{status: %Status{action: f1_action}}, _}) when not is_nil(f1_action),
    do: f1

  defp evaluate({
         f1 = %{status: f1_status},
         %{status: %Status{action: f2_action}}
       }) do
    action =
      (f1_status.strategy[f2_action] || Strategy.default_strategy())
      |> Strategy.choose_action()

    %{f1 | status: %{f1.status | action: action}}
  end

  @spec buff({fighter, fighter}) :: {fighter, fighter}
  @doc """
  The buffs are generated "easily" but after i have to think the different way to know the opponent buff, to hide the buff etc.
  """
  def buff({f1 = %{status: f1_status}, f2 = %{status: f2_status}}) do
    with buff_f1 <- %{f1_status | buff: Action.get_buff(f1_status.action)},
         buff_f2 <- %{f2_status | buff: Action.get_buff(f2_status.action)},
         f1 <- %{f1 | status: buff_f1},
         f2 <- %{f2 | status: buff_f2} do
      {f1, f2}
    end
  end

  @spec resolve_action({fighter, fighter}) :: {fighter, fighter}
  @doc """

  """
  def resolve_action({f1 = %{status: f1_status}, f2 = %{status: f2_status}}) do
    solve_fight = fn f1, f2, dmgs ->
      if f1.status.action.family == Family.offensive() do
        f2_player = %{f2.character | stamina: f2.character.stamina - f2_dgts + f1_dgts}
        {f1, %{f2 | character: f2_player}}
      end
    end

    with f1_dgts <- f1_status.action.value + f1_status.buff,
         f2_dgts <- f2_status.action.value + f2_status.buff do
      cond do
        f1_dgts > f2_dgts ->
          solve_fight.(f1, f2, f1_dgts + f2_dgts)

        f1_dgts < f2_dgts ->
          {f2, f1} = solve_fight.(f2, f1)
          {f1, f2}

        true ->
          {f1, f2}
      end
    end
  end

  def continue_or_end({fighter, fighter}) do
    {fighter, fighter}
  end
end

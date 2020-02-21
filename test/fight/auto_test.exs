defmodule MmorpgTest.Fight.AutoTest do
  use ExUnit.Case
  @moduletag :fight_auto

  alias Mmorpg.Controller.Fight.FightAuto
  alias Mmorpg.Model.Character
  alias Mmorpg.Model.Fight.Status
  alias Mmorpg.Model.Fight.Action.{Atack, Defense}

  @empty_status %{
    character: %Character{
      stamina: 1
    },
    status: %Status{}
  }

  @atk_status %{
    character: %Character{
      stamina: 1
    },
    status: %Status{
      action: %Atack{}
    }
  }

  @dead_character %{
    character: %Character{
      stamina: 0
    },
    status: %Status{}
  }

  test "alives? yes" do
    assert {@empty_status, @empty_status}
           |> FightAuto.alives?()
  end

  test "alives? nop" do
    refute {@dead_character, @empty_status}
           |> FightAuto.alives?()
  end

  test "test select order first" do
    first = %{status: %Status{fighting_order: :first}}

    assert {first, @empty_status}
           |> FightAuto.select_order() == {first, @empty_status}
  end

  test "test select order last" do
    last = %{@empty_status | status: %Status{fighting_order: :last}}

    assert {last, @empty_status}
           |> FightAuto.select_order() == {@empty_status, last}
  end

  test "test select_order empty status" do
    assert {a, b} =
             {@empty_status, @empty_status}
             |> FightAuto.select_order()
  end

  test "test choosing_action" do
    {@empty_status, @empty_status}
    |> FightAuto.choose_action()
  end

  test "test buff" do
    {@atk_status, @atk_status}
    |> FightAuto.buff()
  end

  @tag :aze
  test "test resolve" do
    {@atk_status, @atk_status}
    |> FightAuto.buff()
    |> FightAuto.resolve_action()
    |> IO.inspect()
  end
end

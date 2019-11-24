defmodule MmorpgTest.Init.Test do
  use ExUnit.Case
  @moduletag :init

  alias Mmorpg.Controller.Player
  alias Mmorpg.Controller.Character

  test "create a test player" do
    assert {:ok, player} = Player.get_player(:create, "test", "test")

    assert {:ok, player} = Player.get_player(:signin, "test", "test")

    assert {:ok, _} = Character.create(:off, "MrLow", player)
  end
end

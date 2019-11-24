defmodule MmorpgTest.Init.Test do
  use ExUnit.Case
  @moduletag :init
  alias Mmorpg.Controller.Player

  test "create a test player" do
    Player.get_player(:create, "test", "test")
  end
end

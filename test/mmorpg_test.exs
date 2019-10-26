defmodule MmorpgTest do
  use ExUnit.Case
  doctest Mmorpg

  test "greets the world" do
    assert Mmorpg.hello() == :world
  end
end

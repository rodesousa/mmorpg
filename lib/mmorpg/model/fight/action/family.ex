defmodule Mmorpg.Model.Fight.Action.Family do
  @moduledoc """
  A action is typed

  - `:offensive` do dmgs
  - `:defensive` absorb dmgs
  """

  @offensive :offensive
  defmacro offensive, do: @offensive

  @defensive :defensive
  defmacro defensive, do: @defensive
end

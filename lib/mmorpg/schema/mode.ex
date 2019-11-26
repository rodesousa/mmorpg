defmodule Mmorpg.Schema.Royalist do
  @moduledoc """
  Mode
  """
  @mode :royalist
  def slug, do: @mode
end

defmodule Mmorpg.Schema.Capitalist do
  @mode :capitalist
  def slug, do: @mode
end

defmodule Mmorpg.Schema.Communist do
  @mode :communist
  def slug, do: @mode
end

defprotocol Mmorpg.Controller.Protocols.Alive do
  @moduledoc false

  @doc """
  checks if is alive
  """
  def alive?(data)
end

defimpl Mmorpg.Controller.Protocols.Alive, for: Mmorpg.Model.Character do
  def alive?(%{stamina: stamina}), do: stamina > 0
end

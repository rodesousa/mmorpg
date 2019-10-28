defmodule Mmorpg.Schema.Player do
  use Ecto.Schema

  schema "player" do
    field(:name, :string)
    field(:password, :string)
    has_many(:characters, Mmorpg.Schema.Character)
  end

  def name do
    IO.inspect("azr")
  end
end

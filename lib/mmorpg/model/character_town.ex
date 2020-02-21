defmodule Mmorpg.Schema.CharacterTown do
  @moduledoc """
  Controller CharacterTown

  All of actions about CharacterTown have to pass here
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "character_town" do
    field(:name, :string)
    field(:mode, :string)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:mode])
    |> validate_required([:name, :mode])
  end
end

defmodule Mmorpg.Schema.Character do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset

  schema "character" do
    field(:name, :string)
    field(:patern, :string)
    field(:stamina, :integer)
    field(:atk, :integer)
    field(:vit, :integer)
    field(:defense, :integer)
    field(:moves, :map)
    field(:buffs, :map)
    belongs_to(:player, Mmorpg.Schema.Player)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:patern])
    |> validate_required([:name])
  end

  @doc """
  returns characters by a player
  """
  # @spec get_characters(Mmorpg.Schema.Player.t()) :: list
  def get_characters(%{id: id}) do
    from(
      c in __MODULE__,
      join: p in assoc(c, :player),
      where: p.id == ^id,
      preload: [player: p]
    )
  end
end

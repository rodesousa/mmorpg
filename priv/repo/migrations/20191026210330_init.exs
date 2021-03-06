defmodule Mmorpg.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    create table(:player) do
      add(:name, :string)
      add(:password, :string)
    end

    create table(:character) do
      add(:name, :string)
      add(:patern, :string)
      add(:stamina, :integer)
      add(:atk, :integer)
      add(:vit, :integer)
      add(:defense, :integer)
      add(:moves, :map)
      add(:buffs, :map)
      add(:player_id, references(:player))
    end
  end
end

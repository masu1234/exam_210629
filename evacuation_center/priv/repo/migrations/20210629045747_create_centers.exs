defmodule EvacuationCenter.Repo.Migrations.CreateCenters do
  use Ecto.Migration

  def change do
    create table(:centers) do
      add :name, :string
      add :area, :string
      add :prefecture, :string
      add :city, :string
      add :adress, :string
      add :lng, :float
      add :lat, :float

      timestamps()
    end

  end
end

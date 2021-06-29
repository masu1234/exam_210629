defmodule EvacuationCenter.Evacuation.Center do
  use Ecto.Schema
  import Ecto.Changeset

  schema "centers" do
    field :adress, :string
    field :area, :string
    field :city, :string
    field :lat, :float
    field :lng, :float
    field :name, :string
    field :prefecture, :string

    timestamps()
  end

  @doc false
  def changeset(center, attrs) do
    center
    |> cast(attrs, [:name, :area, :prefecture, :city, :adress, :lng, :lat])
    |> validate_required([:name, :area, :prefecture, :city, :adress, :lng, :lat])
  end
end

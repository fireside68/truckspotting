defmodule Truckspotting.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :address, :string
    field :block, :integer
    field :latitude, :decimal
    field :longitude, :decimal
    field :lot, :integer
    field :schedule_id, :id

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:latitude, :longitude, :address, :block, :lot])
    |> validate_required([:latitude, :longitude, :address, :block, :lot])
  end
end

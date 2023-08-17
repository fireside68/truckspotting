defmodule Truckspotting.FoodTrucks.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :end, :time
    field :int_day_of_week, :integer
    field :start, :time
    field :string_day_of_week, :string
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:int_day_of_week, :string_day_of_week, :start, :end])
    |> validate_required([:int_day_of_week, :string_day_of_week, :start, :end])
  end
end

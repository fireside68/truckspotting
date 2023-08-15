defmodule Truckspotting.FoodTrucks.Applicant do
  @moduledoc """
  A food truck applicant is the legal representation of the food truck. The module includes
  the applicant's business name as registered, permit information, and location description.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          applicant: String.t(),
          location_description: String.t(),
          permit: String.t(),
          permit_location: String.t()
        }

  schema "applicants" do
    field :applicant, :string
    field :location_description, :string
    field :permit, :string
    field :permit_location, :string

    timestamps()
  end

  @doc false
  def changeset(applicant, attrs) do
    applicant
    |> cast(attrs, [:permit, :permit_location, :applicant, :location_description])
    |> validate_required([:permit, :permit_location, :applicant, :location_description])
  end
end

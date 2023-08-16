defmodule Truckspotting.FoodTrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Truckspotting.FoodTrucks` context.
  """

  @doc """
  Generate a applicant.
  """
  def applicant_fixture(attrs \\ %{}) do
    {:ok, applicant} =
      attrs
      |> Enum.into(%{
        applicant: "some applicant",
        location_description: "some location_description",
        permit: "some permit",
        permit_location: "some permit_location"
      })
      |> Truckspotting.FoodTrucks.Applicants.create_applicant()

    applicant
  end
end

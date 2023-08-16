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

  @doc """
  Generate a schedule.
  """
  def schedule_fixture(attrs \\ %{}) do
    {:ok, schedule} =
      attrs
      |> Enum.into(%{
        end: ~T[14:00:00],
        int_day_of_week: 42,
        start: ~T[14:00:00],
        string_day_of_week: "some string_day_of_week"
      })
      |> Truckspotting.FoodTrucks.Schedules.create_schedule()

    schedule
  end
end

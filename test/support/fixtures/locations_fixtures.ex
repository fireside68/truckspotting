defmodule Truckspotting.LocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Truckspotting.Locations` context.
  """

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        address: "some address",
        block: 42,
        latitude: "120.5",
        longitude: "120.5",
        lot: 42
      })
      |> Truckspotting.Locations.create_location()

    location
  end
end

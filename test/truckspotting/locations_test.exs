defmodule Truckspotting.LocationsTest do
  use Truckspotting.DataCase

  alias Truckspotting.Locations

  describe "locations" do
    alias Truckspotting.Locations.Location

    import Truckspotting.LocationsFixtures

    @invalid_attrs %{address: nil, block: nil, latitude: nil, longitude: nil, lot: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{address: "some address", block: 42, latitude: "120.5", longitude: "120.5", lot: 42}

      assert {:ok, %Location{} = location} = Locations.create_location(valid_attrs)
      assert location.address == "some address"
      assert location.block == 42
      assert location.latitude == Decimal.new("120.5")
      assert location.longitude == Decimal.new("120.5")
      assert location.lot == 42
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{address: "some updated address", block: 43, latitude: "456.7", longitude: "456.7", lot: 43}

      assert {:ok, %Location{} = location} = Locations.update_location(location, update_attrs)
      assert location.address == "some updated address"
      assert location.block == 43
      assert location.latitude == Decimal.new("456.7")
      assert location.longitude == Decimal.new("456.7")
      assert location.lot == 43
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end
end

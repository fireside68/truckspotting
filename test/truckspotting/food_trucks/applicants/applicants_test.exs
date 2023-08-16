defmodule Truckspotting.FoodTrucks.Applicants.ApplicantsTest do
  use Truckspotting.DataCase
  import Truckspotting.FoodTrucksFixtures

  alias Truckspotting.FoodTrucks.Applicant
  alias Truckspotting.FoodTrucks.Applicants

  @invalid_attrs %{applicant: nil, location_description: nil, permit: nil, permit_location: nil}

  test "list_applicants/0 returns all applicants" do
    applicant = applicant_fixture()
    assert Applicants.list_applicants() == [applicant]
  end

  test "get_applicant!/1 returns the applicant with given id" do
    applicant = applicant_fixture()
    assert Applicants.get_applicant!(applicant.id) == applicant
  end

  test "create_applicant/1 with valid data creates a applicant" do
    valid_attrs = %{
      applicant: "some applicant",
      location_description: "some location_description",
      permit: "some permit",
      permit_location: "some permit_location"
    }

    assert {:ok, %Applicant{} = applicant} = Applicants.create_applicant(valid_attrs)
    assert applicant.applicant == "some applicant"
    assert applicant.location_description == "some location_description"
    assert applicant.permit == "some permit"
    assert applicant.permit_location == "some permit_location"
  end

  test "create_applicant/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Applicants.create_applicant(@invalid_attrs)
  end

  test "update_applicant/2 with valid data updates the applicant" do
    applicant = applicant_fixture()

    update_attrs = %{
      applicant: "some updated applicant",
      location_description: "some updated location_description",
      permit: "some updated permit",
      permit_location: "some updated permit_location"
    }

    assert {:ok, %Applicant{} = applicant} = Applicants.update_applicant(applicant, update_attrs)

    assert applicant.applicant == "some updated applicant"
    assert applicant.location_description == "some updated location_description"
    assert applicant.permit == "some updated permit"
    assert applicant.permit_location == "some updated permit_location"
  end

  test "update_applicant/2 with invalid data returns error changeset" do
    applicant = applicant_fixture()
    assert {:error, %Ecto.Changeset{}} = Applicants.update_applicant(applicant, @invalid_attrs)
    assert applicant == Applicants.get_applicant!(applicant.id)
  end

  test "delete_applicant/1 deletes the applicant" do
    applicant = applicant_fixture()
    assert {:ok, %Applicant{}} = Applicants.delete_applicant(applicant)
    assert_raise Ecto.NoResultsError, fn -> Applicants.get_applicant!(applicant.id) end
  end

  test "change_applicant/1 returns a applicant changeset" do
    applicant = applicant_fixture()
    assert %Ecto.Changeset{} = Applicants.change_applicant(applicant)
  end
end

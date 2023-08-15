defmodule Truckspotting.Accounts.Roles.RolesTest do
  use Truckspotting.DataCase
  import Truckspotting.AccountsFixtures

  alias Truckspotting.Accounts
  alias Truckspotting.Accounts.Role

  setup do
    invalid_attrs = %{role: nil, description: nil}

    {:ok, %{invalid_attrs: invalid_attrs}}
  end

  # @tag :broken
  test "list_roles/0 returns all roles" do
    role = role_fixture()
    assert Accounts.list_roles() == [role]
  end

  test "get_role!/1 returns the role with given id" do
    role = role_fixture()
    assert Accounts.get_role!(role.id) == role
  end

  test "create_role/1 with valid data creates a role" do
    valid_attrs = %{name: :user, description: "some description"}

    assert {:ok, %Role{} = role} = Accounts.create_role(valid_attrs)
    assert role.description == "some description"
  end

  test "create_role/1 with invalid data returns error changeset", %{invalid_attrs: invalid_attrs} do
    assert {:error, %Ecto.Changeset{}} = Accounts.create_role(invalid_attrs)
  end

  test "update_role/2 with valid data updates the role" do
    role = role_fixture()
    update_attrs = %{description: "some updated description"}

    assert {:ok, %Role{} = role} = Accounts.update_role(role, update_attrs)
    assert role.description == "some updated description"
  end

  test "update_role/2 with invalid data returns error changeset", %{invalid_attrs: invalid_attrs} do
    role = role_fixture()
    assert {:error, %Ecto.Changeset{}} = Accounts.update_role(role, invalid_attrs)
    assert role == Accounts.get_role!(role.id)
  end

  test "delete_role/1 deletes the role" do
    role = role_fixture()
    assert {:ok, %Role{}} = Accounts.delete_role(role)
    assert_raise Ecto.NoResultsError, fn -> Accounts.get_role!(role.id) end
  end

  test "change_role/1 returns a role changeset" do
    role = role_fixture()
    assert %Ecto.Changeset{} = Accounts.change_role(role)
  end
end

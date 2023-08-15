defmodule Truckspotting.Accounts.UserRoles.UserRolesTest do
  use Truckspotting.DataCase
  import Truckspotting.AccountsFixtures

  alias Truckspotting.Accounts
  alias Truckspotting.Accounts.UserRole

  setup do
    invalid_attrs = %{user_id: nil, role_id: nil}
    user = Factory.insert!(:user)
    role = Factory.insert!(:role, [name: :user, description: "Based role"])

    {:ok, %{invalid_attrs: invalid_attrs, role: role, user: user}}
  end

  describe "user_roles" do
    test "list_user_roles/0 returns all user_roles", %{user: user, role: role} do
      user_role = Factory.insert!(:user_role, user_id: user.id, role_id: role.id)
      assert Accounts.list_user_roles() == [user_role]
    end

    test "get_user_role!/1 returns the user_role with given id", %{user: user, role: role} do
      user_role = Factory.insert!(:user_role, user_id: user.id, role_id: role.id)
      assert Accounts.get_user_role!(user_role.id) == user_role
    end

    test "create_user_role/1 with valid data creates a user_role", %{role: role, user: user} do
      valid_attrs = %{user_id: user.id, role_id: role.id}

      assert {:ok, %UserRole{} = _user_role} = Accounts.create_user_role(valid_attrs)
    end

    test "create_user_role/1 with invalid data returns error changeset", %{invalid_attrs: invalid_attrs} do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_role(invalid_attrs)
    end

    test "update_user_role/2 with valid data updates the user_role" do
      user_role = user_role_fixture()
      update_attrs = %{}

      assert {:ok, %UserRole{} = _user_role} = Accounts.update_user_role(user_role, update_attrs)
    end

    test "update_user_role/2 with invalid data returns error changeset", %{invalid_attrs: invalid_attrs} do
      user_role = user_role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_role(user_role, invalid_attrs)
      assert user_role == Accounts.get_user_role!(user_role.id)
    end

    test "delete_user_role/1 deletes the user_role" do
      user_role = user_role_fixture()
      assert {:ok, %UserRole{}} = Accounts.delete_user_role(user_role)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_role!(user_role.id) end
    end

    test "change_user_role/1 returns a user_role changeset" do
      user_role = user_role_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_role(user_role)
    end
  end
end

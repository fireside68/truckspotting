defmodule Truckspotting.AccountsTest do
  use Truckspotting.DataCase

  alias Truckspotting.Accounts

  describe "users" do
    alias Truckspotting.Accounts.User

    import Truckspotting.AccountsFixtures

    @invalid_attrs %{avatar: nil, email_address: nil, first_name: nil, home_city: nil, last_name: nil, latitude: nil, longitude: nil, password: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{avatar: "some avatar", created_at: ~U[2023-08-11 05:38:00Z], email_address: "some email_address", first_name: "some first_name", home_city: "some home_city", last_name: "some last_name", latitude: "120.5", longitude: "120.5", password: "some password", updated_at: ~U[2023-08-11 05:38:00Z], username: "some username"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.avatar == "some avatar"
      assert user.email_address == "some email_address"
      assert user.first_name == "some first_name"
      assert user.home_city == "some home_city"
      assert user.last_name == "some last_name"
      assert user.latitude == Decimal.new("120.5")
      assert user.longitude == Decimal.new("120.5")
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{avatar: "some updated avatar", created_at: ~U[2023-08-12 05:38:00Z], email_address: "some updated email_address", first_name: "some updated first_name", home_city: "some updated home_city", last_name: "some updated last_name", latitude: "456.7", longitude: "456.7", password: "some updated password", updated_at: ~U[2023-08-12 05:38:00Z], username: "some updated username"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.email_address == "some updated email_address"
      assert user.first_name == "some updated first_name"
      assert user.home_city == "some updated home_city"
      assert user.last_name == "some updated last_name"
      assert user.latitude == Decimal.new("456.7")
      assert user.longitude == Decimal.new("456.7")
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "roles" do
    alias Truckspotting.Accounts.Role

    import Truckspotting.AccountsFixtures

    @invalid_attrs %{role: nil, description: nil}

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Accounts.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Accounts.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      valid_attrs = %{role: :user, description: "some description"}

      assert {:ok, %Role{} = role} = Accounts.create_role(valid_attrs)
      assert role.description == "some description"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Role{} = role} = Accounts.update_role(role, update_attrs)
      assert role.description == "some updated description"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_role(role, @invalid_attrs)
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

  describe "user_roles" do
    alias Truckspotting.Accounts.UserRole

    import Truckspotting.AccountsFixtures

    @invalid_attrs %{}

    test "list_user_roles/0 returns all user_roles" do
      user_role = user_role_fixture()
      assert Accounts.list_user_roles() == [user_role]
    end

    test "get_user_role!/1 returns the user_role with given id" do
      user_role = user_role_fixture()
      assert Accounts.get_user_role!(user_role.id) == user_role
    end

    test "create_user_role/1 with valid data creates a user_role" do
      valid_attrs = %{}

      assert {:ok, %UserRole{} = user_role} = Accounts.create_user_role(valid_attrs)
    end

    test "create_user_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_role(@invalid_attrs)
    end

    test "update_user_role/2 with valid data updates the user_role" do
      user_role = user_role_fixture()
      update_attrs = %{}

      assert {:ok, %UserRole{} = user_role} = Accounts.update_user_role(user_role, update_attrs)
    end

    test "update_user_role/2 with invalid data returns error changeset" do
      user_role = user_role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_role(user_role, @invalid_attrs)
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

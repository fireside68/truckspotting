defmodule Truckspotting.Accounts.Users.UsersTest do
  use Truckspotting.DataCase
  import Truckspotting.AccountsFixtures

  alias Truckspotting.Accounts.User
  alias Truckspotting.Accounts.Users

  setup do
    invalid_attrs = %{
      avatar: nil,
      email_address: nil,
      first_name: nil,
      home_city: nil,
      last_name: nil,
      latitude: nil,
      longitude: nil,
      password: nil,
      username: nil
    }

    user = Factory.insert!(:user)
    role = Factory.insert!(:role, name: :user, description: "Test role")
    {:ok, %{invalid_attrs: invalid_attrs, role: role, user: user}}
  end

  test "list_users/0 returns all users", %{user: user} do
    assert Users.list_users() == [user]
  end

  test "get_user!/1 returns the user with given id" do
    user = user_fixture()
    assert Users.get_user(user.id) == user
  end

  test "create_user/1 with valid data creates a user" do
    valid_attrs = %{
      avatar: "some avatar",
      created_at: ~U[2023-08-11 05:38:00Z],
      email_address: "some email_address",
      first_name: "some first_name",
      home_city: "some home_city",
      last_name: "some last_name",
      latitude: "120.5",
      longitude: "120.5",
      password: "some password",
      updated_at: ~U[2023-08-11 05:38:00Z],
      username: "some username"
    }

    assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
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

  test "create_user/1 with invalid data returns error changeset", %{
    invalid_attrs: invalid_attrs
  } do
    assert {:error, %Ecto.Changeset{}} = Users.create_user(invalid_attrs)
  end

  test "update_user/2 with valid data updates the user" do
    user = user_fixture()

    update_attrs = %{
      avatar: "some updated avatar",
      created_at: ~U[2023-08-12 05:38:00Z],
      email_address: "some updated email_address",
      first_name: "some updated first_name",
      home_city: "some updated home_city",
      last_name: "some updated last_name",
      latitude: "456.7",
      longitude: "456.7",
      password: "some updated password",
      updated_at: ~U[2023-08-12 05:38:00Z],
      username: "some updated username"
    }

    assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
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

  test "update_user/2 with invalid data returns error changeset", %{
    invalid_attrs: invalid_attrs
  } do
    user = user_fixture()
    assert {:error, %Ecto.Changeset{}} = Users.update_user(user, invalid_attrs)
    assert user == Users.get_user!(user.id)
  end

  test "delete_user/1 deletes the user" do
    user = user_fixture()
    assert {:ok, %User{}} = Users.delete_user(user)
    assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
  end

  test "change_user/1 returns a user changeset" do
    user = user_fixture()
    assert %Ecto.Changeset{} = Users.change_user(user)
  end
end

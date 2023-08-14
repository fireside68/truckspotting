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
end

defmodule Truckspotting.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Truckspotting.Accounts` context.
  """
  alias Truckspotting.Factory
  alias Truckspotting.Accounts
  alias Truckspotting.Accounts.Roles
  alias Truckspotting.Accounts.Users

  @doc """
  Generate a unique user email_address.
  """
  def unique_user_email_address, do: "some email_address#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user username.
  """
  def unique_user_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        email_address: unique_user_email_address(),
        first_name: "some first_name",
        home_city: "some home_city",
        last_name: "some last_name",
        latitude: "120.5",
        longitude: "120.5",
        password: "some password",
        username: unique_user_username()
      })
      |> Users.create_user()

    user
  end

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        name: :user,
        description: "some description"
      })
      |> Roles.create_role()

    role
  end

  @doc """
  Generate a user_role.
  """
  def user_role_fixture(attrs \\ %{}) do
    {:ok, user_role} =
      attrs
      |> Enum.into(%{
        user_id: Factory.insert!(:user).id,
        role_id: Factory.insert!(:role).id
      })
      |> Accounts.create_user_role()

    user_role
  end
end

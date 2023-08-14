defmodule Truckspotting.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Truckspotting.Accounts` context.
  """

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
      |> Truckspotting.Accounts.create_user()

    user
  end
end

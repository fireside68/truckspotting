defmodule Truckspotting.Factory do
  alias Truckspotting.Repo

  alias Truckspotting.Accounts.Role
  alias Truckspotting.Accounts.User
  alias Truckspotting.Accounts.UserRole

  # Factories

  def build(:user) do
    %User{
      avatar: "some avatar",
      email_address: "some email_address#{System.unique_integer([:positive])}",
      first_name: "some first_name",
      home_city: "some home_city",
      last_name: "some last_name",
      latitude: Decimal.new("120.5"),
      longitude: Decimal.new("120.5"),
      password: "some password",
      username: "some username#{System.unique_integer([:positive])}"
    }
  end

  def build(:role) do
    %Role{
      name: :user,
      description: "Anonymous user"
    }
  end

  def build(:user_role) do
    user = insert!(:user)
    role = insert!(:role)

    %UserRole{
      user_id: user.id,
      role_id: role.id
    }
  end

  def build(factory_name, attributes) do
    factory_name
    |> build()
    |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name
    |> build(attributes)
    |> Repo.insert!()
  end
end

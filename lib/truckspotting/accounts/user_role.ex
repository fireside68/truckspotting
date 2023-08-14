defmodule Truckspotting.Accounts.UserRole do
  @moduledoc """
  Join table used to track users and their roles:

  * `:admin` - Administrators
  * `:customer` - Users who are customers
  * `:owner` - Users who are owners
  * `:user` - Reserved for implementation of anonymous users
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_roles" do

    field :user_id, :id
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_role, attrs) do
    user_role
    |> cast(attrs, [])
    |> validate_required([])
  end
end

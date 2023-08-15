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
    |> cast(attrs, [:user_id, :role_id])
    |> validate_required([:user_id, :role_id])
    |> validate_is_user(:user_id)
  end

  def validate_is_user(changeset, field) when is_atom(field) do
    validate_change(changeset, field, fn field, value ->
      case Truckspotting.Accounts.get_user(value) do
        %Truckspotting.Accounts.User{} = _ -> []
        _ -> [{field, "This references a nonexistent user"}]
      end
    end)
  end
end

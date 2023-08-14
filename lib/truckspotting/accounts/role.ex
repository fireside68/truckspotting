defmodule Truckspotting.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :role, Ecto.Enum, values: [:admin, :customer, :owner, :user]
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role, :description])
    |> validate_required([:role, :description])
  end
end

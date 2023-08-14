defmodule Truckspotting.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @typedoc """
    Typespec for the User module
  """
  @type t :: %__MODULE__{
    id: integer(),
    first_name: String.t(),
    last_name: String.t(),
    email_address: String.t(),
    username: String.t(),
    password: String.t(),
    avatar: String.t(),
    home_city: String.t(),
    latitude: float(),
    longitude: float()
}

  schema "users" do
    field :avatar, :string
    field :email_address, :string
    field :first_name, :string
    field :home_city, :string
    field :last_name, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email_address, :username, :password, :avatar, :home_city, :latitude, :longitude])
    |> validate_required([:first_name, :last_name, :email_address, :username, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email_address)
  end
end

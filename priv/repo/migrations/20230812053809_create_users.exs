defmodule Truckspotting.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email_address, :string
      add :username, :string
      add :password, :string
      add :avatar, :string
      add :home_city, :string
      add :latitude, :decimal
      add :longitude, :decimal

      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email_address])
  end
end

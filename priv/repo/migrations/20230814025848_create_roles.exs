defmodule Truckspotting.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :description, :string

      timestamps()
    end

    alter table(:roles) do
      add :name, :role_names
    end
  end
end

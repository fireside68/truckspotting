defmodule Truckspotting.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :latitude, :decimal
      add :longitude, :decimal
      add :address, :string
      add :block, :integer
      add :lot, :integer
      add :schedule_id, references(:schedules, on_delete: :nilify_all)

      timestamps()
    end

    alter table(:schedules) do
      add :location_id, references(:locations, on_delete: :delete_all)
    end

    create index(:locations, [:schedule_id])
  end
end

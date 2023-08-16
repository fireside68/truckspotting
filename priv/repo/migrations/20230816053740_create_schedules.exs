defmodule Truckspotting.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :int_day_of_week, :integer
      add :string_day_of_week, :string
      add :start, :time
      add :end, :time

      timestamps()
    end
  end
end

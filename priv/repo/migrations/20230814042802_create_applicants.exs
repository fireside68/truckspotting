defmodule Truckspotting.Repo.Migrations.CreateApplicants do
  use Ecto.Migration

  def change do
    create table(:applicants) do
      add :permit, :string
      add :permit_location, :string
      add :applicant, :string
      add :location_description, :string

      timestamps()
    end
  end
end

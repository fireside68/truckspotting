defmodule Truckspotting.Repo.Migrations.AddRolesEnum do
  use Ecto.Migration

  def change do
    create_query = "CREATE TYPE role_names AS ENUM ('admin', 'customer', 'owner', 'user')"
    drop_query = "DROP TYPE role_names"
    execute(create_query, drop_query)
  end
end

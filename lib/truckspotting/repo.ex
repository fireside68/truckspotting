defmodule Truckspotting.Repo do
  use Ecto.Repo,
    otp_app: :truckspotting,
    adapter: Ecto.Adapters.Postgres
end

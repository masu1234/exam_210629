defmodule EvacuationCenter.Repo do
  use Ecto.Repo,
    otp_app: :evacuation_center,
    adapter: Ecto.Adapters.Postgres
end

defmodule LiveviewWorkshop.Repo do
  use Ecto.Repo,
    otp_app: :liveview_workshop,
    adapter: Ecto.Adapters.Postgres
end

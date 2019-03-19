defmodule Breadapp.Repo do
  use Ecto.Repo,
    otp_app: :breadapp,
    adapter: Ecto.Adapters.Postgres
end

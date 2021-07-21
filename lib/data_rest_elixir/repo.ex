defmodule DataRestElixir.Repo do
  use Ecto.Repo,
    otp_app: :data_rest_elixir,
    adapter: Ecto.Adapters.Postgres
end

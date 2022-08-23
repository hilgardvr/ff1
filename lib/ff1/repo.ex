defmodule Ff1.Repo do
  use Ecto.Repo,
    otp_app: :ff1,
    adapter: Ecto.Adapters.Postgres
end

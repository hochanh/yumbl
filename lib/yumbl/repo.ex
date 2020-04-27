defmodule Yumbl.Repo do
  use Ecto.Repo,
    otp_app: :yumbl,
    adapter: Ecto.Adapters.Postgres
end

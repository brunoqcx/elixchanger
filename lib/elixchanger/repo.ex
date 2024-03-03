defmodule Elixchanger.Repo do
  use Ecto.Repo,
    otp_app: :elixchanger,
    adapter: Ecto.Adapters.Postgres
end

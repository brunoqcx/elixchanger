defmodule Elixchanger.Repo.Migrations.CreateExchangeRequests do
  use Ecto.Migration

  def change do
    create table(:exchange_requests) do
      add :initial_currency, :string
      add :end_currency, :string
      add :initial_value_cents, :integer
      add :end_value_cents, :integer
      add :exchange_rate, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end

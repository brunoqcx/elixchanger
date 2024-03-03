defmodule Elixchanger.ExchangeRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exchange_requests" do
    field :end_currency, :string
    field :end_value_cents, :integer
    field :exchange_rate, :decimal
    field :initial_currency, :string
    field :initial_value_cents, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exchange_request, attrs) do
    exchange_request
    |> cast(attrs, [:initial_currency, :end_currency, :initial_value_cents, :end_value_cents, :exchange_rate])
    |> validate_required([:initial_currency, :end_currency, :initial_value_cents, :end_value_cents, :exchange_rate])
  end
end

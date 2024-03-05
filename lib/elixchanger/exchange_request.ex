defmodule Elixchanger.ExchangeRequest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Elixchanger.CurrencyExchange

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
    |> cast(attrs, [:initial_currency, :end_currency, :initial_value_cents])
    |> validate_required([:initial_currency, :end_currency, :initial_value_cents])
    |> set_conversion_values
    |> validate_required([:end_value_cents, :exchange_rate])
  end

  def set_conversion_values(cs) do
    case { cs.valid? } do
      { false } -> cs
      { true } ->
        { exchange_rate, end_value } = CurrencyExchange.convert(cs.changes[:initial_currency], cs.changes[:end_currency], cs.changes[:initial_value_cents])
        cs = put_change(cs, :end_value_cents, end_value)
        put_change(cs, :exchange_rate, exchange_rate)
    end
  end
end

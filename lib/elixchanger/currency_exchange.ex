defmodule Elixchanger.CurrencyExchange do
  def convert(_base_currency, _end_currency, value) do
    exchange_rate = 2
    end_value = exchange_rate * value
    { exchange_rate, end_value }
  end
end

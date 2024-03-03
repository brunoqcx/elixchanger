defmodule ElixchangerWeb.ExchangeRequestsController do
  use ElixchangerWeb, :controller
  alias Elixchanger.Repo
  alias Elixchanger.ExchangeRequest

  def index(conn, _params) do
    exchange_requests = Repo.all(ExchangeRequest)
    render(conn, :index, exchange_requests: exchange_requests)
  end
end

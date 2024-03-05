defmodule ElixchangerWeb.ExchangeRequestsController do
  use ElixchangerWeb, :controller
  alias Elixchanger.Repo
  alias Elixchanger.ExchangeRequest

  def index(conn, _params) do
    exchange_requests = Repo.all(ExchangeRequest)
    render(conn, :index, exchange_requests: exchange_requests)
  end

  def new(conn, _params) do
    changeset = ExchangeRequest.changeset(%ExchangeRequest{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"exchange_request" => params}) do
    changeset = ExchangeRequest.changeset(%ExchangeRequest{}, params)
    case Repo.insert(changeset) do
    {:ok, exchange_request} ->
    conn
    |> put_flash(:info, "exchange_request #{exchange_request.id} created!")
    |> redirect(to: "/")
    {:error, changeset} ->
    render(conn, "new.html", changeset: changeset)
    end
  end
end

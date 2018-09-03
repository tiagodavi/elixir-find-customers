defmodule ManageWeb.ApiController do
  @moduledoc """
  This is the main controller to access the entire api
  """

  use ManageWeb, :controller

  action_fallback(ManageWeb.FallBackController)

  def index(conn, _params) do
    with {:ok, customers} <- {:error, "Customers not found"} do
      render(conn, "customers.json", %{data: customers})
    end
  end
end

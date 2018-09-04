defmodule ManageWeb.CustomerController do
  @moduledoc """
  This is the main controller to access the entire api
  """

  use ManageWeb, :controller
  alias Manage.Models.Customer

  action_fallback(ManageWeb.FallBackController)

  def index(conn, %{"distance" => distance}) do
    {distance, ""} = Integer.parse(distance)

    with {:ok, customers} <- Customer.load(distance) do
      render(conn, "customers.json", %{data: customers})
    end
  end
end

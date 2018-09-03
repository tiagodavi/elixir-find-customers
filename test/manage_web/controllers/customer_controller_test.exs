defmodule ManageWeb.CustomerControllerTest do
  use ManageWeb.ConnCase, async: true

  alias Manage.Models.Customer

  describe "GET api/customers/:distance" do
    test "empty list when there are no accounts", %{conn: conn} do
      path = customer_path(conn, :index, 100)

      conn =
        conn
        |> get(path)

      response = json_response(conn, 200)

      assert response == []
    end
  end
end

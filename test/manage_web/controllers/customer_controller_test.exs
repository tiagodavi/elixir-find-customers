defmodule ManageWeb.CustomerControllerTest do
  use ManageWeb.ConnCase, async: true

  describe "GET api/customers/:distance" do
    test "empty list when there are no customers", %{conn: conn} do
      path = customer_path(conn, :index, 0)

      conn =
        conn
        |> get(path)

      response = json_response(conn, 200)

      assert response == []
    end

    test "customers within 100 km", %{conn: conn} do
      path = customer_path(conn, :index, 100)

      conn =
        conn
        |> get(path)

      response = json_response(conn, 200)

      assert Enum.count(response) > 0
    end
  end
end

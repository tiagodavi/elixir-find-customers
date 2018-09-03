defmodule ManageWeb.CatchAllController do
  @moduledoc """
  This controller is useful to catch any request that was not defined
  into router.ex
  """

  use ManageWeb, :controller

  def index(conn, _params) do
    json(conn, %{errors: "Endpoint not found!"})
  end
end

defmodule ManageWeb.FallBackController do
  @moduledoc """
  This controller intercepts any request that does not
  return a connection
  """
  use ManageWeb, :controller

  def call(conn, {:error, reason}) do
    send_error(conn, 422, reason)
  end
end

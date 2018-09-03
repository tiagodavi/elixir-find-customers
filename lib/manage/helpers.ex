defmodule Manage.Helpers do
  @moduledoc """
    This module is automatically imported for all controllers to provide
    a custom way to send errors to the client
  """

  import Plug.Conn, only: [put_status: 2]
  import Phoenix.Controller, only: [render: 3, put_view: 2]

  def send_error(conn, code, message) when is_binary(message) do
    conn |> prepare_send_error(code) |> render("#{code}.json", %{errors: message})
  end

  defp prepare_send_error(conn, code) do
    conn
    |> put_status(code)
    |> put_view(ManageWeb.ErrorView)
  end
end

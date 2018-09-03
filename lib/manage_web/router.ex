defmodule ManageWeb.Router do
  use ManageWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", ManageWeb do
    pipe_through(:api)
    get("/customers/:distance", CustomerController, :index)
  end

  scope "/", ManageWeb do
    match(:*, "/*path", CatchAllController, :index)
  end
end

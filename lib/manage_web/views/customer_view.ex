defmodule ManageWeb.CustomerView do
  use ManageWeb, :view

  def render("customers.json", %{data: customers}) do
    render_many(customers, ManageWeb.CustomerView, "customer.json", as: :data)
  end

  def render("customer.json", %{data: customer}) do
    %{
      latitude: customer.lat,
      user_id: customer.user_id,
      name: customer.name,
      longitude: customer.lon
    }
  end
end

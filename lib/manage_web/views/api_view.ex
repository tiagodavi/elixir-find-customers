defmodule ManageWeb.ApiView do
  use ManageWeb, :view

  def render("customers.json", %{data: customers}) do
    render_many(customers, ManageWeb.ApiView, "customer.json", as: :data)
  end

  def render("customer.json", %{data: customer}) do
    %{
      latitude: customer.latitude,
      user_id: customer.user_id,
      name: customer.name,
      longitude: customer.longitude
    }
  end
end

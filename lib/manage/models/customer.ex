defmodule Manage.Models.Customer do
  @moduledoc """
  Customer Model to handle business rules
  """

  @dublin_office %{lat: 53.339428, lon: -6.257664}

  alias Manage.Models.CustomerCache

  def load(distance) do
    customers = CustomerCache.all()

    if Enum.empty?(customers) do
      CustomerCache.put_customers(load_txt_file())
      {:ok, find_customers(distance, CustomerCache.all())}
    else
      {:ok, find_customers(distance, customers)}
    end
  end

  defp load_txt_file() do
    case HTTPoison.get!("https://s3.amazonaws.com/intercom-take-home-test/customers.txt") do
      %HTTPoison.Response{status_code: 200, body: body} ->
        items = String.split(body, "\n")

        Enum.map(items, fn item ->
          customer = Poison.decode!(item)
          {lat, _} = Float.parse(customer["latitude"])
          {lon, _} = Float.parse(customer["longitude"])
          %{lat: lat, lon: lon, name: customer["name"], user_id: customer["user_id"]}
        end)

      _ ->
        []
    end
  end

  defp find_customers(distance, customers) do
    customers
    |> Enum.filter(fn customer ->
      meters =
        Distance.GreatCircle.distance(
          {@dublin_office.lat, @dublin_office.lon},
          {customer.lat, customer.lon}
        )

      meters <= distance * 1000.00
    end)
    |> Enum.sort(&(&1.user_id <= &2.user_id))
  end
end

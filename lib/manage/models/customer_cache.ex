defmodule Manage.Models.CustomerCache do
  use Agent

  @moduledoc """
  Customer Cache Model to create a customers cache
  """

  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def all() do
    Agent.get(__MODULE__, & &1)
  end

  def put_customers(customers) do
    Agent.update(__MODULE__, &Enum.concat(&1, customers))
  end
end

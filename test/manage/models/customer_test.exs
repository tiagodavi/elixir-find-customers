defmodule Manage.CustomerTest do
  use ExUnit.Case, async: true

  alias Manage.Models.Customer

  describe ".load" do
    test "returns empty list when there are no customers" do
      assert {:ok, customers} = Customer.load(100)
      assert customers == []
    end
  end
end

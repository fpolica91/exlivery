defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case
  alias Exlivery.Orders.Item
  import Exlivery.Factory
  describe "build/4" do
    test "when successful creates an item" do
      response =
        Item.build(
          "Vegan Pizza",
          :pizza,
          "50.00",
          1
        )

        expected_response = {:ok, build(:item)}
        assert response == expected_response
    end
  end
end

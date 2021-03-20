defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case
  alias Exlivery.Orders.{Item, Order}

  import Exlivery.Factory
  describe "build/4" do
    test "creates an new order" do
      user = build(:user)
      items = [
        build(:item),
        build(:item, description: "tuna sushi", unit_price: "12.00")
      ]
       response = Order.build(user, items)
       expected_response = build(:order)
       assert response == {:ok, expected_response}
    end
  end
end

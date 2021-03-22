defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Order, Item}
  import Exlivery.Factory

    describe "save/1" do
      setup  do
        OrderAgent.start_link(%{})
        :ok
      end

      test "saves the order" do
        order = build(:order)
        assert {:ok, _uuid}  = OrderAgent.save(order)
      end
    end

    describe "get/1" do
      setup  do
        OrderAgent.start_link(%{})
        :ok
      end

      test "saves the order" do
        order = build(:order)
        {:ok, uuid} = OrderAgent.save(order)
        expected_response = {:ok,
           %Order{delivery_address: "112 hopkins drive",
           items: [%Item{category: :pizza, description: "Vegan Pizza", qty: 1, unit_price: Decimal.new("50.00")},
           %Item{category: :pizza, description: "tuna sushi", qty: 1, unit_price: "12.00"}
           ], total_price: Decimal.new("62.00"), user_cpf: "2324252"}
          }
        assert OrderAgent.get(uuid) == expected_response
      end
    end
end

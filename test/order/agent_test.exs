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

      test "gets an order with a given uuid" do
        order = build(:order)
        {:ok, uuid} = OrderAgent.save(order)
        expected_response = {:ok, order}
        assert OrderAgent.get(uuid) == expected_response
      end

      test "returns an error if order not found" do
       assert OrderAgent.get("112233") == {:error, "Order cannot be found"}
      end
    end
end

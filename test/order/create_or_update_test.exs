defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case
  alias Exlivery.Orders.Agent, as: OrdersAgent
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  import Exlivery.Factory

  describe "call/1" do
    setup  do
      OrdersAgent.start_link(%{})
      UserAgent.start_link(%{})
      cpf = "1234"
      {:ok, cpf: cpf}
    end
    test "when all params are valid, saves an order", %{cpf: cpf} do
     %{name: "chloe", email: "chloe@gmail.com", cpf: cpf, age: 25, address: "112 via hopkins"}
     |>CreateOrUpdateUser.call()

     items =  [
      build(:item),
      build(:item)
     ]

     assert assert {:ok, _uuid} = CreateOrUpdateOrders.call(%{user_cpf: cpf, items: items})

    end

    test "when the user information is incorrect, returns an error",  %{cpf: cpf} do
      %{name: "chloe", email: "chloe@gmail.com", cpf: cpf, age: 15, address: "112 via hopkins"}
      |>CreateOrUpdateUser.call()
      items =  [
       build(:item),
       build(:item)
      ]
      assert assert {:error, "invalid Parameters"} = CreateOrUpdateOrders.call(%{user_cpf: cpf, items: items})
    end


    test "when the order is incorrect it returns an error",  %{cpf: cpf} do
      %{name: "chloe", email: "chloe@gmail.com", cpf: cpf, age: 25, address: "112 via hopkins"}
      |>CreateOrUpdateUser.call()
      items =  [
       build(:item),
       build(:item, qty: 0)
      ]
      assert assert {:error, "Invalid Items"} = CreateOrUpdateOrders.call(%{user_cpf: cpf, items: items})
    end
  end
end

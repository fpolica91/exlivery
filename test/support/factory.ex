defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "chloe antonio",
      email: "chloe@gmail.com",
      cpf: "2324252",
      age: 28,
      address: "112 hopkins drive"
    }
  end

  def item_factory do
    {:ok, price} = Decimal.cast("50.00")

    %Item{
      description: "Vegan Pizza",
      category: :pizza,
      unit_price: price,
      qty: 1
    }
  end
  def order_factory do
    %Order{
      delivery_address: "112 hopkins drive",
       items: [
          build(:item),
          build(:item, description: "tuna sushi", unit_price: "12.00")
        ],
          total_price: Decimal.new("62.00"),
          user_cpf: "2324252"
      }
  end
end

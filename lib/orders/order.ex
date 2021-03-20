defmodule Exlivery.Orders.Order do
  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys
  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
    %__MODULE__{
        user_cpf: cpf,
        delivery_address: address,
        items: items,
        total_price: calculate_price(items)
      }
    }
  end

  def build(_user, _items), do: {:error, "invalid Parameters"}

  defp calculate_price(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_values(&1, &2))
  end

  defp sum_values(%Item{unit_price: price, qty: qty}, acc) do
    price
    |>Decimal.mult(qty)
    |>Decimal.add(acc)
  end
end

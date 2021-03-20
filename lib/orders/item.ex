defmodule Exlivery.Orders.Item do
  @categories [:pizza, :hamburger, :sushi, :carne, :prato_feito, :sobremesa]
  @keys [:description, :category, :unit_price, :qty]

  @enforce_keys @keys

  defstruct @keys


  def build(description, category, unit_price, qty)
    when qty > 0 and category in @categories
  do
    unit_price
    |>Decimal.cast()
    |>build_item(description, category, qty)

  end

  def build(_description, _category , _unit_price , _qty), do: {:error, "invalid parameters"}

  defp build_item({:ok, unit_price}, description, category, qty) do
    {:ok, %__MODULE__{
      description: description,
      category: category,
      unit_price: unit_price,
      qty: qty
    }
  }
  end
  defp build_item(:error, _description, _category, _qty), do: {:error, "Invalid price!"}
end

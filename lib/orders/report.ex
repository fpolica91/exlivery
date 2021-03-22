defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Order, Item}
  def create(filename \\ "report.csv") do
    order_list = build_order_list()
    File.write!(filename, order_list)
  end


  defp build_order_list() do
    OrderAgent.list_all()
    |>Map.values()
    |>Enum.map(fn(line) -> order_string(line) end)
  end

  defp order_string(%Order{user_cpf: user_cpf,items: items, total_price: total_price }) do
    items_string = Enum.map(items, fn(item) -> item_string(item) end)
    "#{user_cpf}, #{items_string}, #{total_price} \n"
  end

  defp item_string(%Item{category: category, qty: qty, unit_price: unit_price}) do
    "#{category}, #{qty}, #{unit_price}"
  end
end

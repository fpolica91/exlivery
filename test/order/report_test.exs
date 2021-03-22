defmodule Exlivery.Orders.Reporttest do
  use ExUnit.Case
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report
  import Exlivery.Factory

  describe "create/1" do
    setup  do
      OrderAgent.start_link(%{})
      :ok
    end
    test "creates a report file" do
    :order
    |>build()
    |>OrderAgent.save()

    :order
    |>build()
    |>OrderAgent.save()

    Report.create("report_test.csv")
    response = File.read!("report_test.csv")
    assert response == "2324252, pizza, 1, 50.00pizza, 1, 12.00, 62.00 \n2324252, pizza, 1, 50.00pizza, 1, 12.00, 62.00 \n"
    end
  end
end

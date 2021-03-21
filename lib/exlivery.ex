defmodule Exlivery do
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUsers
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.Agent, as: OrderAgent

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_users(params), to: CreateOrUpdateUsers, as: :call
  defdelegate create_or_update_orders(params), to: CreateOrUpdateOrders, as: :call


  def hello do
    :world
  end
end

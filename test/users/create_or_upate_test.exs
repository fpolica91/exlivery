defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup  do
      UserAgent.start_link(%{})
      :ok
    end
    test "when all params are valid, saves the user" do
     user_params =  %{name: "chloe", email: "chloe@gmail.com", cpf: "12345", age: 25, address: "112 via hopkins"}
     response =  CreateOrUpdate.call(user_params)
     assert response == {:ok, "User Created or updated with success!"}

    end

    test "when there are invalid params returns an error" do
      user_params =  %{name: "chloe", email: "chloe@gmail.com", cpf: "12345", age: 15, address: "112 via hopkins"}
      response =  CreateOrUpdate.call(user_params)
      assert response == {:error, "invalid parameters"}
    end
  end
end

defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User
  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)
      UserAgent.start_link(%{})
      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      cpf = "1234"
      {:ok, cpf: cpf}
    end
    test "when the user is found return user", %{cpf: cpf} do
      :user
      |>build(cpf: cpf)
      |>UserAgent.save()

      response = UserAgent.get(cpf)
      expected_response =   {:ok, %User{address: "112 hopkins drive", age: 28, cpf: "1234", email: "chloe@gmail.com", name: "chloe antonio"}}
      assert response == expected_response
    end

    test "when the user is not found it returns an error" do
      UserAgent.start_link(%{})
      response = UserAgent.get("333")
      assert response == {:ok, nil}
    end
  end
end

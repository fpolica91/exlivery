defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User
  import Exlivery.Factory
  describe "build/5" do
    test "when all the fields are valid return user" do
        response = User.build(
          "chloe antonio",
          "chloe@gmail.com",
           "2324252",
            28,
          "112 hopkins drive"
        )
        expected_response = {:ok , build(:user)}
        assert response == expected_response
    end

    test "when invalid paramters are passed returns an error" do
      response = User.build(
        "chloe antonio",
        "chloe@gmail.com",
         "2324252",
         13,
        "112 hopkins drive"
      )
      assert response == {:error, "invalid parameters"}
    end
  end
end

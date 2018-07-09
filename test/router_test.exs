defmodule RouterTest do
  use ExUnit.Case
  import Mock

  test "getBalance when proper ETH address is passed as argument" do
    with_mock BCX.Connect, [getBalance: fn _ -> 1000000000000000000 end] do
      balance = BCX.Router.getBalance("Oxaddress")
      assert balance == {:ok, "1.0"}
    end
  end

  test "returns error when wrong ETH address is passed as argument" do
      balance = BCX.Router.getBalance(nil)
      assert balance == {:error, "Error: missing Ethereum address in query"}
  end
end

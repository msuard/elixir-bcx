defmodule BCXTest do
  use ExUnit.Case
  import Mock

  test "BCX connects to local Ethereum node" do
    with_mock BCX.Connect, [checkConnection: fn() -> "some Ethereum node" end] do
      connection = BCX.start()
      assert connection === "some Ethereum node"
    end
  end
end




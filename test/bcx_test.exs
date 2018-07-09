defmodule BCXTest do
  use ExUnit.Case
  doctest BCX

  test "starts" do
    BCX.start()
  end

  test "connects" do
    BCX.connect()
  end
end

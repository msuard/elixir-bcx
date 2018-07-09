defmodule BCXTest do
  use ExUnit.Case
  doctest BCX

  test "greets the world" do
    assert BCX.hello() == :world
  end
end

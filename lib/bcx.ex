defmodule BCX do
  @moduledoc """
  Documentation for BCX.
  """

  def start() do
    IO.puts "Hello BCX"

    BCX.Connect.checkConnection()

    BCX.Supervisor.start_link(name: BCX.Supervisor)
  end



end

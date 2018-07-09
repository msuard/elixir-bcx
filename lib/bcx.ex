defmodule BCX do
  @moduledoc """
  Documentation for BCX.
  """

  def start() do
    BCX.Supervisor.start_link(name: BCX.Supervisor)
    IO.puts "Hello BCX"
    BCX.connect()
  end

  def connect() do
     case DynamicSupervisor.start_child(BCX.ConnectSupervisor, BCX.Connect) do
        {:ok, _pid} -> "BCX connected to Ethereum node"
        {:error, error} -> error
        _ -> "Unknown BCX connection error!"
     end
  end
end

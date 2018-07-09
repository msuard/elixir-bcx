defmodule BCX do
  @moduledoc """
  Documentation for BCX.
  """

  def start() do
    IO.puts "\nHello BCX \n"

    connection = BCX.Connect.checkConnection()


    BCX.Supervisor.start_link(name: BCX.Supervisor)

    connection
  end



end

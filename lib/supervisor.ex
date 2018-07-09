defmodule BCX.Supervisor do
  use Supervisor
  use Application

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do

    port = Application.get_env(:bcx, :PORT) || raise "missing $PORT environment variable \n"

    children = [
      {Task.Supervisor, name: BCX.Server.TaskSupervisor},
      {Plug.Adapters.Cowboy, scheme: :http, plug: BCX.Router, options: [port: 8000]}
    ]

    IO.puts "BCX server listening to port " <> Integer.to_string(port) <> "\n"

    Supervisor.init(children, strategy: :one_for_all)


  end
end

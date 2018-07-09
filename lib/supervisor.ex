defmodule BCX.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
     # {DynamicSupervisor, name: BCX.ConnectSupervisor, strategy: :one_for_one},
      {Task.Supervisor, name: BCX.Server.TaskSupervisor},
      {Plug.Adapters.Cowboy, scheme: :http, plug: BCX.Router, options: [port: 8000]}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end

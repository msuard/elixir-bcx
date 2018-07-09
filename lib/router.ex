defmodule BCX.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)


  # ROUTES:
  get "/hello" do
    send_resp(conn, 200, "world")
  end
end

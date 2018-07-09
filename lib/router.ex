defmodule BCX.Router do
  use Plug.Router

  # require Logger

  # plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)


  # ROUTES:
  get "/balance" do
    queryParams = fetchQuery(conn).query_params["address"]
    case getBalance(queryParams) do
     {:error, errorMsg} -> send_resp(conn, 400, errorMsg)
     {:ok, balance} -> send_resp(conn, 200, "Balance = " <> balance <> " ETH")
   end
  end

  def fetchQuery(conn) do
     fetch_query_params(conn)
  end

  def getBalance(queryParams) do
    case queryParams do
      nil ->
        errorMsg = "Error: missing Ethereum address in query"
        {:error, errorMsg}
      address ->
        balance = Float.to_string(Float.round(BCX.Connect.getBalance(address)*1.0e-18, 1))
        {:ok, balance}
      end
  end
end




defmodule BCX.Router do
  use Plug.Router

  # require Logger

  # plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)


  # ROUTES:
  get "/balance" do
    IO.puts "/GET /balance?" <> conn.query_string <> "\n"
    queryParams = fetchQuery(conn).query_params["address"]
    case getBalance(queryParams) do
     {:error, errorMsg} ->
       IO.puts "400, " <> errorMsg <> "\n"
       send_resp(conn, 400, errorMsg)
     {:ok, balance} ->
       IO.puts "200, Balance = " <> balance <> " ETH\n"
       send_resp(conn, 200, "Balance = " <> balance <> " ETH")
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
        case BCX.Connect.getBalance(address) do
          {:error, msg} -> {:error, msg}
          {:ok, bal} ->
            balance = Float.to_string(Float.round(bal*1.0e-18, 1))
            {:ok, balance}
        end
      end
  end
end




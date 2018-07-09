defmodule BCX.Connect do
  @moduledoc """
  Documentation for Connext.

  This module handles connections and requests to Ethereum node using web3 library
  """

  def checkConnection() do
    {:ok, conn} = Ethereumex.HttpClient.web3_client_version
    IO.puts "BCX connected to: " <> conn <>"\n"
  end

  def getBalance(address) do
    case Ethereumex.HttpClient.eth_get_balance(address) do
      {:error, :econnrefused} -> "Error: connection refused"
      {:ok, hexBalance} ->
        {balance, _} = Integer.parse(String.slice(hexBalance, 2..-1), 16)
        balance
    end
  end



end

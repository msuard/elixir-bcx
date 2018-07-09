defmodule BCX.Connect do
  @moduledoc """
  Documentation for Connext.

  This module handles connections and requests to Ethereum node using web3 library
  """
  use Agent, restart: :permanent

  def start_link(_opts) do
    Ethereumex.HttpClient.web3_client_version
  end



end

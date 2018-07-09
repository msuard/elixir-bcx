# BCX

This is a very simple test project for me to get to know Elixir.

Run: BCX.start()

It starts an http server listening to $PORT (as defined in config.exs)

It connects to an Ethereum node. You can use a local test node like Ganache,
or connect to a public node like Infura (make sure you enter the infura url
with your Infura API  key in config.exs)
  
You can then fetch ETH balances on the Ethereum blockchain by sending http
requests with the following query string:

/balance?address=0x.....

Enjoy!


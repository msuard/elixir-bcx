# BCX

**

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

**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bcx` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bcx, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bcx](https://hexdocs.pm/bcx).


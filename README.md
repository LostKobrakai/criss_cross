# CrissCross

<!-- MDOC !-->
CrissCross allows for simple cross compilation using hex precompiled beam packages.

This does work only for projects, which don't have any further native dependencies besides the Erlang Runtime System (ERTS).

## Usage

In your `mix.exs` add the following:

```elixir
def project do
  [
    …,
    releases: releases()
  ]
end

def releases do
  [
    ubuntu_14: [
      include_erts: fn -> CrissCross.ubuntu(14, "OTP-23.1.2") end
    ],
    ubuntu_16: [
      include_erts: fn -> CrissCross.ubuntu(16, "OTP-23.1.2") end
    ]
  ]
end
```

## Available OSs

* Ubuntu 14.04
* Ubuntu 16.04
* Ubuntu 18.04
* Ubuntu 20.04

## Library suggestions

* Authentication
  * `:comeonin`: use `:pbkdf2_elixir` instead of the other implementations, as 
    it doesn't have any NIF dependencies, but is implemented in pure elixir.

<!-- MDOC !-->

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `criss_cross` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:criss_cross, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/criss_cross](https://hexdocs.pm/criss_cross).


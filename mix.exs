defmodule CrissCross.MixProject do
  use Mix.Project

  @github "https://github.com/LostKobrakai/criss_cross"

  def project do
    [
      app: :criss_cross,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs(),
      name: "CrissCross",
      source_url: @github
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "CrissCross allows for simple cross compilation using hex precompiled beam packages."
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @github}
    ]
  end

  defp docs do
    [
      main: "CrissCross"
    ]
  end
end

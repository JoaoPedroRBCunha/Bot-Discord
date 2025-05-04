defmodule TungSahurBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :tungsahurbot,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {TungSahurBot.Application, []}
    ]
  end

  defp deps do
    [
      {:nostrum, "~> 0.10"},
      {:dotenvy, "~> 0.8.0"},
      {:httpoison, "~> 2.0"}
    ]
  end
end

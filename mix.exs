defmodule Untis.MixProject do
  use Mix.Project

  @source_url "https://github.com/xp4u1/untis"

  def project do
    [
      app: :untis,
      version: "1.0.0",
      elixir: "~> 1.13",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      source_url: @source_url
    ]
  end

  defp description do
    "Unofficial Elixir wrapper for the Untis Mobile and WebUntis API"
  end

  defp package do
    [
      description: "Unofficial Elixir wrapper for the Untis Mobile and WebUntis API",
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      logo: "docs/logo-hexdocs.png",
      extras: ["docs/json-rpc.md"]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:ex_doc, "~> 0.26.0", only: :dev, runtime: false}
    ]
  end
end

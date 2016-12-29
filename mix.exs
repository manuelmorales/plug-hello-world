defmodule HelloWorld.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hello_world,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      aliases: [
        test: "test --no-start"
      ],
    ]
  end

  def application do
    [
      applications: [:logger, :cowboy, :plug],
      mod: {HelloWorld.App, []},
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:mix_test_watch, "~> 0.2", only: :dev},
    ]
  end
end

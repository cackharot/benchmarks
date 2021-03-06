defmodule PhxCqrs.Todos.Mixfile do
  use Mix.Project

  def project do
    [
      app: :todos,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      build_embedded: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger,:eventstore],
      mod: {PhxCqrs.Todos.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commands, in_umbrella: true},
      {:events, in_umbrella: true},
      {:infrastructure, in_umbrella: true},

      # 3rd part deps
      {:commanded, "~> 0.15"},
      {:commanded_ecto_projections, "~> 0.6"},
      {:commanded_eventstore_adapter, "~> 0.3"},
      {:phoenix_ecto, "~> 3.3"},
      {:uuid, "~> 1.1"},
      {:vex, "~> 0.6"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true},
    ]
  end
end

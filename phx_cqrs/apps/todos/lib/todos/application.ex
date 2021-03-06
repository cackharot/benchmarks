defmodule PhxCqrs.Todos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      supervisor(PhxCqrs.Todos.Repo, []),
      # Todos supervisor
      supervisor(PhxCqrs.Todos.Supervisor, []),
      # Starts a worker by calling: PhxCqrs.Todos.Worker.start_link(arg)
      # {PhxCqrs.Todos.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxCqrs.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

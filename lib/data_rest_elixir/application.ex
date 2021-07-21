defmodule DataRestElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DataRestElixir.Repo,
      # Start the Telemetry supervisor
      DataRestElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DataRestElixir.PubSub},
      # Start the Endpoint (http/https)
      DataRestElixirWeb.Endpoint
      # Start a worker by calling: DataRestElixir.Worker.start_link(arg)
      # {DataRestElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DataRestElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DataRestElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule AbxGist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AbxGistWeb.Telemetry,
      AbxGist.Repo,
      {DNSCluster, query: Application.get_env(:abx_gist, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AbxGist.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AbxGist.Finch},
      # Start a worker by calling: AbxGist.Worker.start_link(arg)
      # {AbxGist.Worker, arg},
      # Start to serve requests, typically the last entry
      AbxGistWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AbxGist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AbxGistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

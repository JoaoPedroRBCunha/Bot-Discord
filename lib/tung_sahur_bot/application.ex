defmodule TungSahurBot.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TungSahurBot
    ]

    opts = [strategy: :one_for_one, name: TungSahurBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

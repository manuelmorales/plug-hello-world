defmodule TimeMachine.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(TimeMachine.PlugConnector, [])
    ]

    opts = [strategy: :one_for_one, name: TimeMachine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


defmodule Scend do
  use Application


  @server_name Scend.Server
  @client_name Scend.Client

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Scend.Server, [[port: 8080, name: @server_name]]),
    ]


    opts = [strategy: :one_for_one, name: Scend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

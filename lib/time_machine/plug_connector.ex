defmodule TimeMachine.PlugConnector do
  import Plug.Conn
  alias TimeMachine.{TimeshotsRepo, PlugConnector}

  def init(options), do: options

  def call(conn, _opts) do
    body = Poison.encode! TimeshotsRepo.pop

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http PlugConnector, []
  end
end

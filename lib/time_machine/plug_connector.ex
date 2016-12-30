defmodule TimeMachine.PlugConnector do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    body = get_time
    |> time_to_api
    |> to_json

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end

  defp get_time do
    %TimeMachine.Timeshot{time: DateTime.utc_now}
  end

  defp time_to_api(time) do
    time
  end

  defp to_json(api) do
    Poison.encode! api
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http TimeMachine.PlugConnector, []
  end
end

defmodule HelloWorld do
  defmodule PlugConnector do
    import Plug.Conn

    def init(options) do
      IO.puts "Starting connector"
      options
    end

    def call(conn, _opts) do
      IO.puts "Calling connector"
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "Hello world")
    end

    def start_link do
      {:ok, _} = Plug.Adapters.Cowboy.http HelloWorld.PlugConnector, []
    end
  end
end

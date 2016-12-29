defmodule HelloWorld.PlugConnector do
  import Plug.Conn

  def init(options), do: options

  @doc ~S"""
  Returns "Hello World"

  ## Examples

  iex> request = Plug.Test.conn(:get, "/", "")
  iex> response = HelloWorld.PlugConnector.call request, []
  iex> response.resp_body
  "Hello world"
  iex> response.status
  200


  """
  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http HelloWorld.PlugConnector, []
  end
end

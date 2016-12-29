defmodule HelloWorldTest.PlugConnectorTest do
  use ExUnit.Case
  use Plug.Test

  @connector HelloWorld.PlugConnector
  @opts @connector.init([])

  test "has body Hello world" do
    conn = conn(:get, "/", "") |> @connector.call(@opts)
    assert conn.resp_body == "Hello world"
  end

  test "has status 200" do
    conn = conn(:get, "/", "") |> @connector.call(@opts)
    assert conn.status == 200
  end
end

defmodule HelloWorldTest.PlugConnectorTest do
  use ExUnit.Case
  use Plug.Test

  test "has body Hello world" do
    opts = HelloWorld.PlugConnector.init([])
    conn = conn(:get, "/", "") |> HelloWorld.PlugConnector.call(opts)
    assert conn.resp_body == "Hello world"
  end

  test "has status 200" do
    opts = HelloWorld.PlugConnector.init([])
    conn = conn(:get, "/", "") |> HelloWorld.PlugConnector.call(opts)
    assert conn.status == 200
  end
end

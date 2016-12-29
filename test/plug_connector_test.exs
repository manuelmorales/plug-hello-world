defmodule TimeMachineTest.PlugConnectorTest do
  use ExUnit.Case
  doctest TimeMachine.PlugConnector
  use Plug.Test

  @connector TimeMachine.PlugConnector
  @opts @connector.init([])

  test "has body TimeMachine world" do
    conn = conn(:get, "/", "") |> @connector.call(@opts)
    assert conn.resp_body == "TimeMachine world"
  end

  test "has status 200" do
    conn = conn(:get, "/", "") |> @connector.call(@opts)
    assert conn.status == 200
  end
end

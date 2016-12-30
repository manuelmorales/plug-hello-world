defmodule TimeMachineTest.PlugConnectorTest do
  use ExUnit.Case
  use Plug.Test

  @connector TimeMachine.PlugConnector
  @opts @connector.init([])

  test "returns JSON" do
    type = do_request.resp_headers
    |> Enum.find(&(elem(&1, 0) == "content-type"))
    |> elem(1)
    |> String.split(";")
    |> List.first

    assert type == "application/json"
  end

  test "returns 200" do
    assert do_request.status == 200
  end

  test "returns the time" do
    body = Poison.Parser.parse!(do_request.resp_body)
  end

  defp do_request() do
    conn(:get, "/", "") |> @connector.call(@opts)
  end
end

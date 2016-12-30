defmodule TimeMachineTest.PlugConnectorTest do
  use ExUnit.Case
  use Plug.Test

  @connector TimeMachine.PlugConnector
  @opts @connector.init([])

  test "returns JSON" do
    type = Plug.Conn.get_resp_header(do_request, "content-type")
    |> List.first
    |> String.split(";")
    |> List.first

    assert type == "application/json"
  end

  test "returns 200" do
    assert do_request.status == 200
  end

  test "returns a time" do
    do_request.resp_body
    |> Poison.Parser.parse!
    |> Map.get("time")
    |> Calendar.DateTime.Parse.rfc3339_utc
  end

  defp do_request() do
    conn(:get, "/", "") |> @connector.call(@opts)
  end
end

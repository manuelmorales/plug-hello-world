defmodule TimeMachineTest.TimeshotTest do
  use ExUnit.Case

  test "has a time" do
    timeshot = %TimeMachine.Timeshot{time: DateTime.utc_now}
    assert timeshot.time.__struct__ == DateTime
  end
end

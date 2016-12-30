defmodule TimeMachineTest.TimeshotTest do
  use ExUnit.Case
  import TimeMachine

  test "has a time" do
    timeshot = %TimeMachine.Timeshot{time: DateTime.utc_now}
    assert timeshot.time.__struct__ == DateTime
  end
end

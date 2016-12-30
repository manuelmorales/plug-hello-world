defmodule TimeMachineTest.TimeshotsRepoTest do
  use ExUnit.Case

  describe "pop" do
    test "returns a Timeshot" do
      timeshot = TimeMachine.TimeshotsRepo.pop
      assert timeshot.__struct__ == TimeMachine.Timeshot
    end
  end
end

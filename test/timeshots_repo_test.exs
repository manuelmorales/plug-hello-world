defmodule TimeMachineTest.TimeshotsRepoTest do
  use ExUnit.Case
  import DateTime, only: [to_unix: 1, utc_now: 0]
  alias TimeMachine.{TimeshotsRepo, Timeshot}
  @subject TimeshotsRepo

  setup do
    @subject.start_link
    :ok
  end

  describe "pop" do
    test "returns a Timeshot" do
      timeshot = @subject.pop

      assert timeshot.__struct__ == Timeshot
    end
  end

  describe "blank state" do
    test "returns a Timeshot with time now" do
      timeshot = @subject.pop

      assert_in_delta to_unix(timeshot.time), to_unix(utc_now), 1
    end
  end

  describe "pushed time" do
    test "returns a Timeshot with the pushed time" do
      pushed_time = DateTime.from_unix!(0)
      @subject.pushn %{time: pushed_time, count: 1}

      timeshot = @subject.pop

      assert to_unix(timeshot.time) == to_unix(pushed_time)
    end
  end
end

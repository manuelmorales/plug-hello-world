defmodule TimeMachine.TimeshotsRepo do
  def pop do
    %TimeMachine.Timeshot{time: DateTime.utc_now}
  end
end

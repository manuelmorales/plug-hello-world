defmodule TimeMachine.Timeshot do
  @enforce_keys [:time]
  defstruct time: DateTime.utc_now
end

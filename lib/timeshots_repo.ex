defmodule TimeMachine.TimeshotsRepo do
  def start_link do
    Agent.start_link(fn -> nil end, name: __MODULE__)
  end

  def pop do
    state = read

    if state == nil do
      %TimeMachine.Timeshot{time: DateTime.utc_now}
    else
      shot = decrease(state)

      case shot do
        %{ count: 0 } -> write(nil)
        shot -> write(shot)
      end

      shot
    end
  end

  defp decrease(shot) do
    Map.merge(shot, %{count: shot.count - 1})
  end

  def pushn(shot), do: write(shot)

  defp read do
    Agent.get __MODULE__, &( &1 )
  end

  defp write(value) do
    Agent.update __MODULE__, fn _ -> value end
  end
end

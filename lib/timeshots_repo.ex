defmodule TimeMachine.TimeshotsRepo do
  def start_link do
    Agent.start_link(fn -> nil end, name: :test)
  end

  def pop do
    Agent.get :test, &(&1)
  end

  def pushn(shot) do
    Agent.update :test, fn(_) -> shot end
  end
end

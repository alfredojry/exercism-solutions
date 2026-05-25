defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(code \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, code)
        loop(code)
      {:take_a_number, sender_pid} ->
        ans = code + 1
        send(sender_pid, ans)
        loop(ans)
      :stop -> 0
      _ ->
        loop()
    after
      1000 -> nil
    end
  end
end

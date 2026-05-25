defmodule Newsletter do
  def read_emails(path) do
    File.read!(path) |> String.trim() |> String.split("\n", trim: true)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    pid = open_log(log_path)
    send_to_many(emails, pid, send_fun)
    close_log(pid)
  end

  defp send_to_many([], _pid, _send_fun) do
  end

  defp send_to_many([email], pid, send_fun) do
    if send_fun.(email) == :ok do
      log_sent_email(pid, email)
    end
  end

  defp send_to_many([email | tail], pid, send_fun) do
    send_to_many([email], pid, send_fun)
    send_to_many(tail, pid, send_fun)
  end
end

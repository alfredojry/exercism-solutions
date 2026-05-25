defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    NaiveDateTime.to_time(datetime)
    |> Time.compare(~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    days = return_days(checkout_datetime)
    NaiveDateTime.add(checkout_datetime, days, :day)
    |> NaiveDateTime.to_date()
  end

  defp return_days(checkout_datetime) do
    if(before_noon?(checkout_datetime), do: 28, else: 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = NaiveDateTime.to_date(actual_return_datetime)
    |> Date.diff(planned_return_date)
    if(diff > 0, do: diff, else: 0)
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_dt = datetime_from_string(checkout)
    return_dt = datetime_from_string(return)
    days = return_date(checkout_dt)
    |> days_late(return_dt)
    amount = days * rate
    if(monday?(return_dt), do: amount * 0.5 |> trunc(), else: amount)
  end
end

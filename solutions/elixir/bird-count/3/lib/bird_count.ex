defmodule BirdCount do
  def today([]) do
    nil
  end

  def today(list) do
    [head | _tail] = list
    head
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count(list) do
    [_head | tail] = list
    [today(list) + 1 | tail]
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?([0]) do
    true
  end

  def has_day_without_birds?([0 | _tail]) do
    true
  end

  def has_day_without_birds?([_head | tail]) do
    has_day_without_birds?(tail)
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    head + total(tail)
  end

  def busy_days([]) do
    0
  end

  def busy_days([num]) when num >= 5 do
    1
  end

  def busy_days([_num]) do
    0
  end

  def busy_days([head | tail]) when head >= 5 do
    1 + busy_days(tail)
  end

  def busy_days([_head | tail]) do
    busy_days(tail)
  end
end

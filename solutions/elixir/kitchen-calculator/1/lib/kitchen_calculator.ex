defmodule KitchenCalculator do
  def get_volume({_, num}) do
    num
  end

  def to_milliliter({:milliliter, num}) do
    {:milliliter, num}
  end

  def to_milliliter({:cup, num}) do
    {:milliliter, num * 240}
  end

  def to_milliliter({:fluid_ounce, num}) do
    {:milliliter, num * 30}
  end

  def to_milliliter({:teaspoon, num}) do
    {:milliliter, num * 5}
  end

  def to_milliliter({:tablespoon, num}) do
    {:milliliter, num * 15}
  end

  def from_milliliter({:milliliter, num}, :milliliter) do
    {:milliliter, num}
  end

  def from_milliliter({:milliliter, num}, :cup) do
    {:cup, num / 240}
  end

  def from_milliliter({:milliliter, num}, :fluid_ounce) do
    {:fluid_ounce, num / 30}
  end

  def from_milliliter({:milliliter, num}, :teaspoon) do
    {:teaspoon, num / 5}
  end

  def from_milliliter({:milliliter, num}, :tablespoon) do
    {:tablespoon, num / 15}
  end

  def convert(volume_pair, unit) do
    milliliters = to_milliliter(volume_pair)
    from_milliliter(milliliters, unit)
  end
end

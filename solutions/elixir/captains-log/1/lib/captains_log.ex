defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    @planetary_classes |> Enum.random()
  end

  def random_ship_registry_number() do
    "NCC-#{1000..9999 |> Enum.random()}"
  end

  def random_stardate() do
    {a, b} = {41_000, 42_000}
    a + :rand.uniform * (b - a)
  end

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate]) |> to_string()
  end
end

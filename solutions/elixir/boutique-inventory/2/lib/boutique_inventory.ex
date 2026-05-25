defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(!&1.price))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn (%{price: price, name: name, quantity_by_size: quantity_by_size}) ->
      %{
        price: price,
        name: String.replace(name, old_word, new_word),
        quantity_by_size: quantity_by_size
      }
    end
  )
  end

  def increase_quantity(item, count) do
    %{
      name: item[:name],
      price: item[:price],
      quantity_by_size: item[:quantity_by_size] |> Map.new(fn {key, val} -> {key, val + count} end)
    }
  end

  def total_quantity(item) do
    item[:quantity_by_size] |> Enum.reduce(0, fn {_key, value}, acc -> value + acc end)
  end
end

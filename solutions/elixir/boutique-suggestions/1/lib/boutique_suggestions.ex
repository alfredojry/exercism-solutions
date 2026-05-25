defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = if(options[:maximum_price], do: options[:maximum_price], else: 100.00)
    for  top <- tops,
         bottom <- bottoms,
        top.base_color != bottom.base_color,
        top.price + bottom.price <= maximum_price do
        {top, bottom}
    end
  end
end

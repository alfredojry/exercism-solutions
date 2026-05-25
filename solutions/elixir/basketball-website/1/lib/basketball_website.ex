defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    extract(data, String.split(path, "."))
  end

  defp extract(data, [slug]) do
    data[slug]
  end

  defp extract(data, [slug | tail]) do
    extract(data[slug], tail)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end

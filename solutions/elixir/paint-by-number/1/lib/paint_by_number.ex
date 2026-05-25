defmodule PaintByNumber do
  defp custom_log(num, x \\ 1) do
    if Integer.pow(2, x) >= num do
      x
    else
      custom_log(num, x + 1)
    end
  end

  def palette_bit_size(color_count) do
    custom_log(color_count)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::size(2), 1::size(2), 2::size(2), 3::size(2)>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count) do
    nil
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<place::size(bit_size), _::bitstring>> = picture
    place
  end

  def drop_first_pixel(<<>>, _color_count) do
    <<>>
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_first::size(bit_size), rest::bitstring>> = picture
    <<rest::bitstring>>
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end

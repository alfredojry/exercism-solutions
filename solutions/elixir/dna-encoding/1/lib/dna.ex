defmodule DNA do
  def encode_nucleotide(code_point) do
    map = %{?\s => 0, ?A => 1, ?C => 2, ?G => 4, ?T => 8}
    map[code_point]
  end

  def decode_nucleotide(encoded_code) do
    map = %{0 => ?\s, 1 => ?A, 2 => ?C, 4 => ?G, 8 => ?T}
    map[encoded_code]
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], bs) do
    bs
  end

  defp do_encode([code_point], bs) do
    <<bs::bitstring, encode_nucleotide(code_point)::size(4)>>
  end

  defp do_encode([head | tail], bs) do
    <<do_encode([head], bs)::bitstring, do_encode(tail, <<>>)::bitstring>>
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(<<>>, list) do
    list
  end

  defp do_decode(<<encoded_code::size(4)>>, list) do
    list ++ [decode_nucleotide(encoded_code)]
  end

  defp do_decode(<<encoded_code::size(4), rest::bitstring>>, list) do
    do_decode(<<encoded_code::size(4)>>, list) ++ do_decode(<<rest::bitstring>>, [])
  end
end

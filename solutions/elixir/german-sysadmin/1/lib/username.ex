defmodule Username do
  def sanitize([]) do
    ~c""
  end

  def sanitize([char]) do
    case char do
      95 -> [char]
      char when char >=97 and char <= 122 -> [char]
      223 -> ~c"ss"
      228 -> ~c"ae"
      246 -> ~c"oe"
      252 -> ~c"ue"
      _ -> ~c""
    end
  end

  def sanitize(username) do
    [head | tail] = username
    sanitize([head]) ++ sanitize(tail)
  end
end

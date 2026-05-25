defmodule Username do
  def sanitize([]) do
    ~c""
  end

  def sanitize([char]) do
    case char do
      ?_ -> [char]
      char when char >=97 and char <= 122 -> [char]
      ?ß -> ~c"ss"
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      _ -> ~c""
    end
  end

  def sanitize(username) do
    [head | tail] = username
    sanitize([head]) ++ sanitize(tail)
  end
end

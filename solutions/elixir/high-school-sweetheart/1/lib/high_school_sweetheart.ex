defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name = String.trim_leading(name)
    String.at(name, 0)
  end

  def initial(name) do
    "#{String.upcase(first_letter(name))}."
  end

  def initials(full_name) do
    [firstname, lastname] = String.split(full_name)
    "#{initial(firstname)} #{initial(lastname)}"
  end

  def pair(full_name1, full_name2) do
    "     ******       ******\n" <>
    "   **      **   **      **\n" <>
    " **         ** **         **\n" <>
    "**            *            **\n" <>
    "**                         **\n" <>
    "**     #{initials(full_name1)}  +  #{initials(full_name2)}     **\n" <>
    " **                       **\n" <>
    "   **                   **\n" <>
    "     **               **\n" <>
    "       **           **\n" <>
    "         **       **\n" <>
    "           **   **\n" <>
    "             ***\n" <>
    "              *\n"
  end
end

defmodule Chop do
  def pick(n, gss, _, _) when n == gss do
    IO.puts n
  end

  def pick(n, gss, min, _) when n < gss do
    guess(n, min..gss - 1)
  end

  def pick(n, gss, _, max) when n > gss do
    guess(n, gss + 1..max)
  end

  def guess(n, first..last) do
    gss = div(first + last, 2)
    IO.puts "Is it #{gss}"
    pick(n, gss, first, last)
  end
end

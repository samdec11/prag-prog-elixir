defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([ head | tail ]), do: [ head+1 | add_1(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  ## Could do these below, but then you have to remember the 0 every time you call sum:
  # def sum([], total), do: total
  # def sum([ head | tail ], total), do: sum(tail, head+total)

  ## So hide it with private functions like this:
  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head+total)

  def reduce([], value, _), do: value
  def reduce([ head | tail ], value, func) do
    reduce(tail, func.(head, value), func)
  end
end

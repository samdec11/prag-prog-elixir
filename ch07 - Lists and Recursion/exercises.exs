defmodule MyList do
  # ListsAndRecursion-0
  # I defined our `sum` function to carry a partial total as a second parameter so I could
  # illustrate how to use accumulators to build values. The `sum` function can also be written
  # without an accumulator. Can you do it?
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  # ListsAndRecursion-1
  # Write a `mapsum` function that takes a list and a function. It applies the function to each
  # element of the list and then sums the result, so
  # MyList.mapsum [1, 2, 3], &(&1 * &1) -> 14
  def mapsum([], _), do: 0
  def mapsum([ head | tail ], func), do: func.(head) + mapsum(tail, func)

  # ListsAndRecursion-2
  # Write a `max(list)` that returns the element with the maximum value in the list. (This is
  # slightly trickier than it sounds.)
  def max([ head | tail ]), do: _max(tail, head)

  defp _max([], current), do: current
  defp _max([ head | tail ], current) when head > current, do: _max(tail, head)
  defp _max([ _ | tail ], current), do: _max(tail, current)

  # ListsAndRecursion-3
  # An Elixir single-quoted string is actually a list of individual character codes. Write a
  # `caesar(list, n)` function that adds `n` to each list element, wrapping if the addition results
  # in a character greater than `z`.
  def caesar([], _), do: []
  def caesar([ head | tail ], n) when head + n > ?z, do: [ head + n - 26 | caesar(tail, n) ]
  def caesar([ head | tail ], n), do: [ head + n | caesar(tail, n) ]

  # ListsAndRecursion-4
  # Write a function `MyList.span(from, to)` that returns a list of the numbers from `from` up to `to`.
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]
end

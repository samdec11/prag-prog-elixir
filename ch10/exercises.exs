defmodule MyList do
  # ListsAndRecursion-5
  # Implement the following Enum functions using no library functions or list comprehensions: all?,
  # each, filter, split, and take. You may need to use an if statment to implement filter. The
  # syntax for this is:
  #
  # if condition do
  #   expression(s)
  # else
  #   expression(s)
  # end

  def all?([], _func), do: true
  def all?([ head | tail ], func), do: func.(head) && all?(tail, func)

  def each([], _func), do: :ok
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
    :ok
  end

  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def split([ head | tail ], num) when num > 0 do
    {left, right} = split(tail, num - 1)
    {[ head | left ], right}
  end
  def split(list, _num), do: {[], list}

  def take([ head | tail ], num) when num > 0 do
    [ head | take(tail, num - 1)]
  end
  def take(_list, 0), do: []

  # ListsAndRecursion-6
  # (Hard) Write a flatten(list) function that takes a list that may contain any number of
  # sublists, which themselves may contain sublists, to any depth. It returns the elements of
  # these lists as a flat list.
  #
  # iex> MyList.flatten([1, [2, 3, [4]], 5, [[[6]]]])
  # [1,2,3,4,5,6]
  # Hint: You may have to use Enum.reverse to get your result in the correct order.

  def flatten([]), do: []
  def flatten([ head | tail ]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [head]

  # A more performant solution:
  # defmodule MyList do
  #   def flatten(list), do: do_flatten(list, [])

  #   def do_flatten([h|t], tail) when is_list(h) do
  #     do_flatten(h, do_flatten(t, tail))
  #   end

  #   def do_flatten([h|t], tail) do
  #     [h|do_flatten(t, tail)]
  #   end

  #   def do_flatten([], tail) do
  #     tail
  #   end
  # end
end

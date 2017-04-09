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

  # ListsAndRecursion-7
  # In the last exercise of Chapter 7 on page 65, you wrote a `span` function. Use it and list
  # comprehensions to return a list of prime numbers from 2 to n.

  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]

  def span_primes(num) do
    for x <- span(2, num), x == 2 || rem(x, 2) > 0 && rem(x, 3) > 0, do: x
  end

  # ListsAndRecursion-8
  # The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC), so we have to charge
  # sales tax on orders shipped to these states. The rates can be expressed as a keyword list:
  #
  tax_rates = [ NC: 0.075, TX: 0.08 ]
  #
  # Here's a list of orders:
  orders = [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount: 35.50 ],
    [ id: 125, ship_to: :TX, net_amount: 24.00 ],
    [ id: 126, ship_to: :TX, net_amount: 44.80 ],
    [ id: 127, ship_to: :NC, net_amount: 25.00 ],
    [ id: 128, ship_to: :MA , net_amount: 10.00 ],
    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
    [ id: 130, ship_to: :NC, net_amount: 50.00 ]
  ]
  #
  # Write a function that takes both lists and returns a copy of the orders, but with an extra
  # field, total_amount, which is the net plus sales tax. If a shipment is not to NC or TX, there's
  # no tax applied.

  def apply_tax(orders, tax_rates) do
    orders |> Enum.map(fn o ->
      tax_amount = if tax_rates[o[:ship_to]], do: o[:net_amount] * tax_rates[o[:ship_to]], else: 0
      Keyword.put(o, :total_amount, (o[:net_amount] + tax_amount))
    end)
  end
end

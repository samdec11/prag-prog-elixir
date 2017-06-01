defmodule MyModule do
  # ControlFlow-1
  # Rewrite the FizzBuzz example using `case`
  defmodule FizzBuzz do
    def upto(n) when n > 0, do: _upto(1, n, [])

    defp _upto(_current, 0, result), do: Enum.reverse result
    defp _upto(current, left, result) do
      next_answer =
        case current do
          n when rem(n, 3) == 0 and rem(n, 5) == 0 ->
            "FizzBuzz"
          n when rem(n, 3) == 0 ->
            "Fizz"
          n when rem(n, 5) == 0 ->
            "Buzz"
          n ->
            n
        end
      _upto(current+1, left-1, [ next_answer | result ])
    end
  end

  # ControlFlow-2
  # We now have three different implementations of FizzBuzz. One uses `cond`, one uses `case`, and
  # one uses separate functions with guard clauses. Take a minute to look at all three. Which do you
  # feel best expresses the problem? Which will be easiest to maintain? The `case` style and the
  # implementation using guard clauses are different from control structures in most other languages.
  # If you feel that one of these was the best implementation, can you think of ways to remind
  # yourself to investigate these options as you write Elixir code in the future?

  # ControlFlow-3
  # Many built-in functions have two forms. The xxx form returns the tuple {:ok, data} and the xxx!
  # form returns data on success but raises an exception otherwise. However, some functions don't
  # have the xxx! form. Write an ok! function that takes an arbitrary parameter. If the parameter is
  # the tuple {:ok, data}, return the data. Otherwise, raise an exception containing information from
  # the parameter. You could use your function like this:
  # file = ok! File.open("somefile")
  def ok!(file) do
    case file do
      {:ok, data} ->
        data
      {:error, message} ->
        raise "Error raised with: #{message}"
    end
  end
end

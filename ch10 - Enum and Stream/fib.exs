Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15)
#=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]

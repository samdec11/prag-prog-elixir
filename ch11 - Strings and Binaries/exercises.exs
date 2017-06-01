defmodule MyModule do
  # StringsAndBinaries-1
  # Write a function that returns true if a single-quoted string contains only printable ASCII
  # characters (space through tilde).
  def is_ascii?([char])
  when char in (32..126), do: true
  def is_ascii?(_), do: false

  # StringsAndBinaries-2
  # Write an anagram?(word1, word2) that returns true if its parameters are anagrams
  def anagram?(word1, word2) do
    if length(word1) != length(word2) do
      false
    else
      all_chars_in_word?(word1, word2) && all_chars_in_word?(word2, word1)
    end
  end
  defp all_chars_in_word?([], _), do: true
  defp all_chars_in_word?([ head | tail ], word) do
    head in word && all_chars_in_word?(tail, word)
  end

  # StringsAndBinaries-3
  # Try the following in iex:
  # iex> [ 'cat' | 'dog' ]
  # ['cat', 100, 111, 103]
  # Why does iex print 'cat' as a string, but 'dog' as individual numbers?
  # > It sees these as a whole list because we've said the head is 'cat' and the tail is a list of
  # numbers

  # StringsAndBinaries-4
  # (Hard) Write a function that takes a single-quoted string of the form number [+-*/] number and
  # returns the result of the calculation. The individual numbers do not have leading plus or minus
  # signs.
  # calculate('123 + 27') # => 150
  def calculate(xs) do
    [num1, operator, num2] = to_string(xs) |> String.split

    apply Kernel, String.to_atom(operator), Enum.map([num1, num2], &String.to_integer/1)
  end

  # StringsAndBinaries-5
  # Write a function that takes a list of dqs and prints each on a separate line, centered in a
  # column that has the width of the longest string. Make sure it works with UTF characters.
  # iex> center(["cat", "zebra", "elephant"])
  #   cat
  #  zebra
  # elephant
  def center(list_of_strings) do
    max_length = list_of_strings
    |> Enum.max_by(&String.length/1)
    |> String.length

    list_of_strings
    |> Enum.each(&(print_centered(&1, max_length)))
  end

  defp print_centered(string, max_length) do
    padding = String.duplicate(" ", div(max_length - String.length(string), 2))
    IO.write padding
    IO.puts string
  end

  # StringsAndBinaries-6
  # Write a function to capitalize the sentences in a string. Each sentence is terminated by a
  # period and a pace. Right now, the case of the characters in the string is random.
  # iex> capitalize_sentences("oh. a DOG. woof. ")
  # "Oh. A dog. Woof. "
  def capitalize_sentences(str) do
    str
    |> String.split(". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end

  # StringsAndBinaries-7
  # Chapter 10 had an exercise about calculating sales tax on page 110. We now have the sales
  # information in a file of comma-separated id, ship_to, and amount values. The file looks like
  # this:
  # id,ship_to,net_amount
  # 123,:NC,100.00
  # 124,:OK,35.50
  # 125,:TX,24.00
  # 126,:TX,44.80
  # 127,:NC,25.00
  # 128,:MA,10.00
  # 129,:CA,102.00
  # 120,:NC,50.00
  # Write a function that reads and parses this file and then passes the result to the sales_tax
  # function. Remember that the data should be formatted into a keyword list and that the fields
  # need to be the correct types (so the id field is an integer, and so on).
  #
  # You'll need the library functions File.open, IO.read(file, :line), and IO.stream(file).
  def parse_file(filename) do
    filename
    |> File.stream!
    |> Enum.map(&IO.puts/1)
  end
end

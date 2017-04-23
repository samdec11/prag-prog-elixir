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
end

# ModulesAndFunctions-7
# Find the library functions to do the following, and then use in iex. (If the word Elixir or
# Erlang appears at the end of the challenge, then you'll find the answer in that set of
# libraries.)

# - Convert a float to a string with two decimal digits. (Erlang)
:io.format("~.2f~n", [2.0/3.0])

# - Get the value of an operating-system environment variable. (Elixir)
System.get_env("HOME")

# - Return the extension component of a file name (so return .exs if given "dav/test.exs"). (Elixir)
Path.extname("sean/test.exs")

# - Return the process's current working directory. (Elixir)
System.cwd

# - Convert a string contining JSON into Elixir data structures. (Just find; don't install.)

# There are many options. Some, such as https://github.com/guedes/exjson,
# are specifically for Elixir. Others, such as https://github.com/hio/erlang-json
# are Erlang libraries that are usable from Elixir.

# - Execute a command in your operating system's shell.
System.cmd("date", [])
System.cmd("ls", ["-al"])

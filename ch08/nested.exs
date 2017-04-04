defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

report = %BugReport{owner: %Customer{name: "Dave", company: "Pragmatic"}, details: "broken"}
# To change a value in the nested struct, you can, but shouldn't, do this
report = %BugReport{report | owner: %Customer{report.owner | company: "PragProg"}}
# Better is this:
put_in(report.owner.company, "PragProg")

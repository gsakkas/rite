CaseG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,VarG)])
match digits n with
| x :: [] -> x

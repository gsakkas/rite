CaseG (fromList [(VarPatG,Nothing,BopG EmptyG EmptyG),(LitPatG,Nothing,VarG)])
match x with
| 0 -> a
| x -> x * x

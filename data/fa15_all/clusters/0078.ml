CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])
match xs with
| [] -> 0
| xf :: xb -> xf + sumList xb
match xs with
| [] -> 0
| h :: t -> h + sumList t

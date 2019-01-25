CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])
match xs with
| [] -> 0
| h :: _ -> h
| h :: t -> h + sumList t

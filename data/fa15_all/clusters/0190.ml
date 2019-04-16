CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConsPatG VarPatG WildPatG,Nothing,VarG),(ConPatG Nothing,Nothing,LitG)])
match xs with
| [] -> 0
| h :: _ -> h
| h :: t -> h + sumList t

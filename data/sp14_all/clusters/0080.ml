CaseG VarG (fromList [(VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)

CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])
match xs with
| [] -> 0
| x :: xs' -> x + sumList xs'
match xs with
| [] -> 0
| x :: y -> x + sumList y
match xs with
| [] -> 0
| h :: t -> h + sumList t

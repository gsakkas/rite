LetG NonRec (fromList [(ConsPatG VarPatG VarPatG,VarG)]) (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t

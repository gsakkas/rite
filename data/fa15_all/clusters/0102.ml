LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))
let sum = fst x + snd x in
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)

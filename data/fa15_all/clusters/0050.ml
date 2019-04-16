LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
let sum = fst x + snd x in
match a with
| h :: t -> ((h + sum) / 10) :: (((h + sum) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]

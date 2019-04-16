LetG NonRec (fromList [(VarPatG,ConAppG (Just EmptyG))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')

LetG NonRec (fromList [(VarPatG,VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let seen' = seen in
let rest' = t in
helper (seen' , rest')

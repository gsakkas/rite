LetG NonRec (fromList [(VarPatG,VarG)]) (AppG (fromList [EmptyG]))
let rest' = t in
helper (seen' , rest')

LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (TupleG (fromList [EmptyG]))
let ff = f b in (ff , b = ff)
let result = f b in
(result , result = b)

LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG),(TuplePatG (fromList [EmptyPatG]),Just EmptyG,EmptyG)]))
let res = f b in
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x

LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG),(Just EmptyG,EmptyG)]))
let res = f b in
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x

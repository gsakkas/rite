CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)

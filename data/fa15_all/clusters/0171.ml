CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])
match f x with
| x -> (x , false)
| y -> (y , true)
match f x with
| x -> (x , false)
| y -> (y , true)

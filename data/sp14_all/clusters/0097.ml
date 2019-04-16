CaseG VarG (fromList [(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG)])
match e with
| Average (x' , y') -> (x +. y) /. 2.0

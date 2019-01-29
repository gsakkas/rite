CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing)])
match l with
| [] -> l
| h :: t -> h :: (listReverse t)
match l with
| [] -> l
| h :: t -> h :: (listReverse t)

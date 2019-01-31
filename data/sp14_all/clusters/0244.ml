CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),AppG (fromList [AppG (fromList [VarG])])]))) Nothing)])
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))

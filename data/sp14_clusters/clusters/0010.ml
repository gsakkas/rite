CaseG VarG [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG [AppG [VarG],AppG [AppG [VarG]]])) Nothing)]
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))

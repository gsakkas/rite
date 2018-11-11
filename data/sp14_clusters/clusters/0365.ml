CaseG VarG [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG [VarG,AppG [VarG]])) Nothing)]
match l with
| [] -> l
| h :: t -> h :: (listReverse t)
match l with
| [] -> l
| h :: t -> h :: (listReverse t)

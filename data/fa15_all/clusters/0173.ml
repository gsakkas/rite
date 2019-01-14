CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG (BopG VarG LitG)]))) Nothing]))) Nothing),(Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing)])
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)

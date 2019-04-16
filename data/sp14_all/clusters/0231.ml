CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG])),(TuplePatG (fromList [WildPatG]),Nothing,TupleG (fromList [EmptyG]))])
match x with
| (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
| (_ , _) -> (carry / 10 , (carry mod 10) :: rest)

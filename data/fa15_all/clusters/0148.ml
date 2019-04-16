TupleG (fromList [LitG,LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG])
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)

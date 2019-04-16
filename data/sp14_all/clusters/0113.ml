CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,ConAppG (Just EmptyG)),(WildPatG,Nothing,VarG)])
match x with
| (h1 , h2) -> ((h1 + h2) / 10) :: (((h1 + h2) mod 10) :: a)
| _ -> a

CaseG VarG [(WildPatG,Nothing,VarG),(TuplePatG (fromList [EmptyPatG]),Nothing,AppG [EmptyG,EmptyG])]
match x with
| (h1 , h2) -> ((h1 + h2) / 10) :: (((h1 + h2) mod 10) :: a)
| _ -> a

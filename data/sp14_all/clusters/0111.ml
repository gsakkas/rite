CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(WildPatG,Nothing,ListG (fromList [EmptyG]))])
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]

CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,ConAppG (Just EmptyG)),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: t :: s -> head :: (tail :: (t :: s))

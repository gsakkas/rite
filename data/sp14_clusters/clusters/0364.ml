CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: t :: s -> head :: (tail :: (t :: s))
match l with
| [] -> []
| h1 :: [] -> [h1]
| h :: t -> h :: (listReverse t)

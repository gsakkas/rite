CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)]
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []
match l with
| x :: [] -> []
| hd :: tl -> hd :: (removeLast tl)
| [] -> []

CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
match y with
| [] -> [x]
| h :: t -> h :: (append x t)
match l with
| [] -> []
| h :: t -> h :: (listReverse t)
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])

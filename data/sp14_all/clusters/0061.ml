CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG EmptyG (fromList [(ConPatG Nothing,Nothing,EmptyG)]))])
match a with
| (list1 , list2) -> match list1 with
                     | [] -> match x with
                             | (h1 , h2) -> ((h1 + h2) :: list1 , list2)

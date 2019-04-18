CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG),(ConPatG Nothing,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)])
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)

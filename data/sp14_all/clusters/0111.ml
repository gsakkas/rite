CaseG VarG [(ConPatG Nothing,Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG),(ConsPatG EmptyPatG EmptyPatG,Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)]
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)

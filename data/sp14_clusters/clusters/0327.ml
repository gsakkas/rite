CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG),(Nothing,LetG NonRec [EmptyG] EmptyG)]
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)

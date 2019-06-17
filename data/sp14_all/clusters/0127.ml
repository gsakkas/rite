CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConsPatG EmptyPatG EmptyPatG,Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)]
match rest with
| [] -> seen
| hd :: tl -> (let seen' =
                 hd :: seen in
               let rest' = tl in
               helper (seen' , rest'))

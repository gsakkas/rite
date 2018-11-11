CaseG VarG [(Nothing,VarG),(Nothing,LetG NonRec [EmptyG] EmptyG)]
match rest with
| [] -> seen
| hd :: tl -> (let seen' =
                 hd :: seen in
               let rest' = tl in
               helper (seen' , rest'))

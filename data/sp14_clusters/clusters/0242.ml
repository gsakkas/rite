LetG NonRec [VarG] (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t

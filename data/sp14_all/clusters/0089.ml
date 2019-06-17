CaseG VarG [(ConPatG Nothing,Nothing,LitG),(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]
match xs with
| [] -> 0
| hd :: tl -> f 0 hd

CaseG VarG [(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,ListG EmptyG Nothing)]
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []
match l with
| x :: [] -> x
| hd :: tl -> last tl
| [] -> []

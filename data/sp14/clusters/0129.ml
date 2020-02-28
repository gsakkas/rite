CaseG VarG [(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]
match xs with
| hd :: tl -> f (f hd hd) tl

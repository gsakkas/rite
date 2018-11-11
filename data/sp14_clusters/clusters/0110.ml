CaseG VarG [(Nothing,AppG [EmptyG,EmptyG])]
match n with
| n -> [] @ [n mod 10]
match xs with
| hd :: tl -> f (f hd hd) tl

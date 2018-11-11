CaseG (AppG [EmptyG]) [(Nothing,AppG [EmptyG]),(Nothing,VarG)]
match f b with
| (x , true) -> wwhile (f , x)
| (x , false) -> x

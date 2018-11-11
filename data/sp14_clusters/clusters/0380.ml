CaseG VarG [(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,VarG)]
match e with
| VarX -> x
| Sine m -> sin (pi *. eval (m , x , y))
| _ -> x

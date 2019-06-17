CaseG VarG [(ConPatG Nothing,Nothing,VarG),(WildPatG,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG])]
match e with
| VarX -> x
| Sine m -> sin (pi *. eval (m , x , y))
| _ -> x

CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG])]
match e with
| VarX -> x
| VarY -> y
| Sine ex -> sin (pi *. eval (ex , x , y))

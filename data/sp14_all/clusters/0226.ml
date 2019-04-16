CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,VarG)])
match e with
| VarX -> x
| Sine m -> sin (pi *. eval (m , x , y))
| _ -> x

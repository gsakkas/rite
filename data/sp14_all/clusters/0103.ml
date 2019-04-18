CaseG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG]))])
match e with
| VarX -> x
| VarY -> y
| Sine ex -> sin (pi *. eval (ex , x , y))

CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG)])
match e with
| VarX -> x
| VarY -> y
| Sine x1 -> sin (pi *. eval (x1 , x , y))
| Cosine x1 -> cos (pi *. eval (x1 , x , y))
| Average (x1 , x2) -> (eval (x1 , x , y) +. eval (x2 , x , y)) /. 2.0
match e with
| VarX -> x
| VarY -> y
| Sine x1 -> sin (pi *. eval (x1 , x , y))
| Cosine x1 -> cos (pi *. eval (x1 , x , y))
| Average (x1 , x2) -> (eval (x1 , x , y) +. eval (x2 , x , y)) /. 2.0

CaseG VarG [(Nothing,VarG),(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Just (BopG EmptyG EmptyG),AppG [EmptyG])]
match e with
| VarX -> x
| VarY -> y
| Sine e1 -> sin (pi *. eval (e1 , x , y))
| Cosine e1 -> cos (pi *. eval (e1 , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) when eval (e1 , x , y) < eval (e2 , x , y) -> eval (e3 , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine e1 -> sin (pi *. eval (e1 , x , y))
| Cosine e1 -> cos (pi *. eval (e1 , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) when eval (e1 , x , y) < eval (e2 , x , y) -> eval (e3 , x , y)

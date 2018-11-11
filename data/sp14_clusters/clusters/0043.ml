CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,VarG),(Nothing,VarG)]
match e with
| Thresh (w , t , u , z) -> if eval (w , x , y) < eval (t , x , y)
                            then eval (u , x , y)
                            else eval (z , x , y)
| Times (t , u) -> eval (t , x , y) *. eval (u , x , y)
| Average (t , u) -> (eval (t , x , y) *. eval (u , x , y)) /. 2.0
| Cosine t -> cos (pi *. eval (t , x , y))
| Sine t -> sin (pi *. eval (t , x , y))
| VarX -> x
| VarY -> y

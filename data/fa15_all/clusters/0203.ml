CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG),(Nothing,IteG EmptyG EmptyG EmptyG)])
match e with
| VarX -> x
| VarY -> y
| Sine b -> sin (pi *. eval (b , x , y))
| Cosine b -> cos (pi *. eval (b , x , y))
| Average (a , b) -> (eval (a , x , y) +. eval (b , x , y)) /. 2.0
| Times (a , b) -> eval (a , x , y) *. eval (b , x , y)
| Thresh (a , b , c , d) -> if eval (a , x , y) < eval (b , x , y)
                            then eval (c , x , y)
                            else eval (d , x , y)
| TripMult (a , b , c) -> (eval (a , x , y) *. eval (b , x , y)) *. eval (c , x , y)
| _ -> 0.0

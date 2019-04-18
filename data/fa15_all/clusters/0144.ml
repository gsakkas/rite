CaseG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG),(WildPatG,Nothing,LitG)])
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

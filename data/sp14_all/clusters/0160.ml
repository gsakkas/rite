CaseG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])
match e with
| VarX -> x
| VarY -> y
| Sine e1 -> sin (pi *. eval (e1 , x , y))
| Cosine e1 -> cos (pi *. eval (e1 , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) when eval (e1 , x , y) < eval (e2 , x , y) -> eval (e3 , x , y)

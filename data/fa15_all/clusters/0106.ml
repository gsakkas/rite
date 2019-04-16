CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG)])
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)

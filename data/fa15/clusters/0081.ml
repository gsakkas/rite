CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG]),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG]),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG)]
EMPTY
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)

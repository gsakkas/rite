LetG NonRec [(VarPatG,LitG)] (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])
EMPTY
let pi = 3.142 in
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)

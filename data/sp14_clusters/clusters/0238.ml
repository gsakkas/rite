CaseG VarG [(Nothing,VarG),(Nothing,VarG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG)]
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)

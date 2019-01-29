CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])
match e with
| VarX -> x +. 0.0
| VarY -> y +. 0.0
| Sine s1 -> sin (pi *. eval (s1 , x , y))
| Cosine c1 -> cos (pi *. eval (c1 , x , y))
| Average (a1 , a2) -> (eval (a1 , x , y) +. eval (a2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (h1 , h2 , h3 , h4) -> if eval (h1 , x , y) < eval (h2 , x , y)
                                then eval (h3 , x , y)
                                else eval (h4 , x , y)
match e with
| VarX -> x +. 0.0
| VarY -> y +. 0.0
| Sine s1 -> sin (pi *. eval (s1 , x , y))
| Cosine c1 -> cos (pi *. eval (c1 , x , y))
| Average (a1 , a2) -> (eval (a1 , x , y) +. eval (a2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (h1 , h2 , h3 , h4) -> if eval (h1 , x , y) < eval (h2 , x , y)
                                then eval (h3 , x , y)
                                else eval (h4 , x , y)

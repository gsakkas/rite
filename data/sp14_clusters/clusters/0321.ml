CaseG VarG [(Nothing,VarG),(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)]
match e with
| VarX -> x
| VarY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
| Op1 e -> tan (pi *. eval (e , x , y)) -. (tan (pi *. eval (e , x , y)) /. 2.0)
| Op2 (e1 , e2 , e3) -> if eval (e1 , x , y) > eval (e2 , x , y)
                        then eval (e3 , x , y)
                        else eval (e1 , x , y) -. eval (e2 , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
| Op1 e -> tan (pi *. eval (e , x , y)) -. (tan (pi *. eval (e , x , y)) /. 2.0)
| Op2 (e1 , e2 , e3) -> if eval (e1 , x , y) > eval (e2 , x , y)
                        then eval (e3 , x , y)
                        else eval (e1 , x , y) -. eval (e2 , x , y)
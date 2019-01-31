CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)

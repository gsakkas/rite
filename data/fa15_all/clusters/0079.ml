CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG)])
match e with
| VarX -> x
| VarY -> y
| Sine a -> sin (pi *. eval (a , x , y))
| Cosine b -> cos (pi *. eval (b , x , y))
| Average (c , d) -> eval (c , x , y) +. (eval (d , x , y) /. 2.0)
| Times (e , f) -> eval (e , x , y) *. eval (f , x , y)
| Thresh (g , h , i , j) -> if eval (g , x , y) < eval (h , x , y)
                            then eval (i , x , y)
                            else eval (j , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine sine -> sin (pi *. eval (sine , x , y))
| Cosine cosine -> cos (pi *. eval (cosine , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (th1 , th2 , th3 , th4) -> if eval (th1 , x , y) < eval (th2 , x , y)
                                    then eval (th3 , x , y)
                                    else eval (th4 , x , y)
match e with
| VarX -> x
| VarY -> y
| Sine a -> sin (pi *. eval (a , x , y))
| Cosine a -> cos (pi *. eval (a , x , y))
| Average (a , b) -> (eval (a , x , y) +. eval (b , x , y)) /. 2.0
| Times (a , b) -> eval (a , x , y) *. eval (b , x , y)
| Thresh (a , b , c , d) -> if eval (a , x , y) < eval (b , x , y)
                            then eval (c , x , y)
                            else eval (d , x , y)

CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG]),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG]),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,IteG EmptyG EmptyG EmptyG)]
EMPTY
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

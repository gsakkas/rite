IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)
if (eval (p , x , y) -. eval (q , x , y)) < 0.0
then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
else eval (p , x , y) -. eval (q , x , y)

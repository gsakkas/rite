LetG NonRec (fromList [(VarPatG,IteG EmptyG EmptyG EmptyG)]) (BopG EmptyG EmptyG)
let diff =
  if (eval (p , x , y) -. eval (q , x , y)) < 0.0
  then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
  else eval (p , x , y) -. eval (q , x , y) in
diff /. 2.0

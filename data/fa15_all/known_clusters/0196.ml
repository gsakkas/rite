LetG NonRec (fromList [BopG EmptyG EmptyG]) (BopG EmptyG EmptyG)
let d =
  (eval (m , x , y) +. eval (n , x , y)) +. eval (o , x , y) in
sqrt (d ** d) /. 3.0

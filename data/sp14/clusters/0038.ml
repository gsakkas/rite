BopG (BopG EmptyG EmptyG) (AppG [EmptyG])
(eval (e1 , x , y) *. eval (e2 , x , y)) /. eval (e3 , x , y)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. float_of_int 2
((float_of_int (-1) *. eval (e1 , x , y)) *. eval (e2 , x , y)) *. eval (e3 , x , y)
(eval (e1 , x , y) -. eval (e2 , x , y)) -. eval (e3 , x , y)
(eval (e1 , x , y) /. eval (e2 , x , y)) /. eval (e3 , x , y)
(sin (pi *. eval (e , x , y)) +. cos (pi *. eval (e , x , y))) *. cos (pi *. eval (e , x , y))
(eval (a , x , y) *. eval (a , x , y)) *. eval (a , x , y)
(eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))) +. eval (c , sin (pi *. x) , sin (pi *. y))
eval (f , x , y) +. (eval (g , x , y) *. eval (h , x , y))
((eval (e1 , x , y) ** 2.0) +. (eval (e2 , x , y) ** 2.0)) +. (eval (e3 , x , y) ** 2.0)
(eval (e1 , x , y) +. eval (e2 , x , y)) -. eval (e3 , x , y)

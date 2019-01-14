
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | OneOver e -> if (eval (e, x, y)) > 1 then 1 / (eval (e, x, y)) else 1 / 3
  | OneOverAvg (e1,e2,e3) ->
      if (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y))) > 1
      then 1 / (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y)))
      else (-1) / 3;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 /. 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) /. 3.0;;

*)

(* changed spans
(27,46)-(27,47)
1.0
LitG

(27,50)-(27,66)
1.0 /. eval (e , x , y)
BopG LitG (AppG (fromList [EmptyG]))

(27,50)-(27,66)
1.0
LitG

(27,76)-(27,77)
1.0 /. 3.0
BopG LitG LitG

(29,6)-(31,19)
1.0
LitG

(29,6)-(31,19)
3.0
LitG

(29,10)-(29,49)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(29,11)-(29,28)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,16)-(30,55)
1.0
LitG

(30,17)-(30,34)
1.0 /. ((eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y))
BopG LitG (BopG EmptyG EmptyG)

(30,17)-(30,34)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(30,17)-(30,34)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,17)-(30,34)
1.0
LitG

(31,18)-(31,19)
(- 1.0) /. 3.0
BopG (UopG EmptyG) LitG

*)

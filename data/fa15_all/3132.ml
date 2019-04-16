
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
(27,40)-(27,41)
1.0
LitG

(27,47)-(27,67)
1.0 /. eval (e , x , y)
BopG LitG (AppG (fromList [EmptyG]))

(27,73)-(27,78)
1.0 /. 3.0
BopG LitG LitG

(29,10)-(29,71)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(29,74)-(29,75)
1.0
LitG

(30,12)-(30,77)
1.0 /. ((eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y))
BopG LitG (BopG EmptyG EmptyG)

(31,12)-(31,20)
(- 1.0) /. 3.0
BopG (UopG EmptyG) LitG

*)

(* type error slice
(19,20)-(19,45)
(19,27)-(19,44)
(19,28)-(19,32)
(27,21)-(27,37)
(27,21)-(27,41)
(27,22)-(27,26)
(27,40)-(27,41)
(27,47)-(27,67)
(27,51)-(27,67)
(27,52)-(27,56)
(29,11)-(29,50)
(29,12)-(29,29)
(29,13)-(29,17)
(29,32)-(29,49)
(29,33)-(29,37)
(30,17)-(30,56)
(30,18)-(30,35)
(30,19)-(30,23)
(30,38)-(30,55)
(30,39)-(30,43)
*)

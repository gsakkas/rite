
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) * (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) * (eval (u, x, y))) / 2
  | Cosine t -> cos (pi * (eval (t, x, y)))
  | Sine t -> sin (pi * (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(19,20)-(19,55)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,22)-(20,63)
(eval (t , x , y) *. eval (u , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(21,21)-(21,44)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(22,19)-(22,42)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(21,17)-(21,20)
(21,17)-(21,44)
(21,21)-(21,44)
(21,22)-(21,24)
(22,15)-(22,18)
(22,15)-(22,42)
(22,19)-(22,42)
(22,20)-(22,22)
*)


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
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
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

*)

(* type error slice
(19,20)-(19,36)
(19,20)-(19,55)
(19,21)-(19,25)
(21,21)-(21,45)
(21,28)-(21,44)
(21,29)-(21,33)
(22,19)-(22,43)
(22,26)-(22,42)
(22,27)-(22,31)
*)

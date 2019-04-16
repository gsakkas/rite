
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | ArcSine of expr
  | ArcCosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> sin (pi *. (eval (e, x, y)))
  | ArcSine e -> 1 /. (sin (pi *. (eval (e, x, y))))
  | ArcCosine e -> 1 /. (cos (pi *. (eval (e, x, y))))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | ArcSine of expr
  | ArcCosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> sin (pi *. (eval (e, x, y)))
  | ArcSine e -> 1. /. (sin (pi *. (eval (e, x, y))))
  | ArcCosine e -> 1. /. (cos (pi *. (eval (e, x, y))))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(21,18)-(21,19)
1.0
LitG

(22,20)-(22,21)
1.0
LitG

*)

(* type error slice
(21,18)-(21,19)
(21,18)-(21,53)
(22,20)-(22,21)
(22,20)-(22,55)
*)

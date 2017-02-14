
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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. e)
  | Cosine e -> cos (pi *. e)
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;


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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;

*)

(* changed spans
(17,26)-(17,27)
(18,17)-(18,29)
(18,28)-(18,29)
(19,26)-(19,68)
(23,18)-(23,19)
(23,21)-(23,22)
(23,24)-(23,25)
(24,12)-(24,16)
(24,18)-(24,19)
(24,18)-(24,25)
(24,21)-(24,22)
(24,24)-(24,25)
*)

(* type error slice
(14,3)-(24,25)
(14,3)-(24,25)
(17,20)-(17,27)
(17,26)-(17,27)
(18,22)-(18,29)
(18,28)-(18,29)
*)

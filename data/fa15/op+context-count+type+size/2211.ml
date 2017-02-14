
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) -> x + y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(26,20)-(26,21)
(26,20)-(26,25)
(26,24)-(26,25)
*)

(* type error slice
(14,4)-(26,27)
(14,15)-(26,25)
(15,3)-(26,25)
(15,3)-(26,25)
(15,3)-(26,25)
(15,3)-(26,25)
(15,3)-(26,25)
(15,3)-(26,25)
(16,14)-(16,15)
(18,15)-(18,18)
(18,15)-(18,40)
(18,20)-(18,40)
(18,27)-(18,31)
(18,27)-(18,40)
(19,17)-(19,20)
(19,17)-(19,42)
(20,26)-(20,71)
(21,23)-(21,58)
(23,7)-(25,25)
(24,12)-(24,16)
(24,12)-(24,25)
(26,20)-(26,21)
(26,20)-(26,25)
*)

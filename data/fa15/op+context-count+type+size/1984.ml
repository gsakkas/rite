
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
(26,19)-(26,20)
(26,19)-(26,24)
(26,23)-(26,24)
*)

(* type error slice
(14,3)-(26,26)
(14,14)-(26,24)
(15,2)-(26,24)
(15,2)-(26,24)
(15,2)-(26,24)
(15,2)-(26,24)
(15,2)-(26,24)
(15,2)-(26,24)
(16,13)-(16,14)
(18,14)-(18,17)
(18,14)-(18,42)
(18,18)-(18,42)
(18,25)-(18,41)
(18,26)-(18,30)
(19,16)-(19,19)
(19,16)-(19,44)
(20,23)-(20,70)
(21,21)-(21,59)
(23,6)-(25,25)
(24,11)-(24,15)
(24,11)-(24,25)
(26,19)-(26,20)
(26,19)-(26,24)
*)

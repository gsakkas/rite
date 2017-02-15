
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(11,14)-(23,25)
(12,2)-(23,25)
(12,11)-(12,16)
(16,18)-(16,41)
(17,20)-(17,43)
(18,21)-(18,58)
(18,21)-(18,62)
(18,22)-(18,38)
(18,61)-(18,62)
(19,19)-(19,35)
(19,19)-(19,54)
*)

(* type error slice
(12,2)-(23,25)
(12,11)-(12,16)
(16,14)-(16,17)
(16,14)-(16,41)
(16,18)-(16,41)
(16,18)-(16,41)
(16,19)-(16,21)
(17,16)-(17,19)
(17,16)-(17,43)
(17,20)-(17,43)
(17,20)-(17,43)
(17,21)-(17,23)
*)

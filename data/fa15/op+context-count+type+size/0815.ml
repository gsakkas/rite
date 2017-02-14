
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3 in
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
(11,15)-(23,25)
(12,3)-(23,25)
(12,12)-(12,13)
(16,20)-(16,39)
(17,22)-(17,41)
(18,24)-(18,37)
(18,24)-(18,56)
(18,24)-(18,63)
(18,62)-(18,63)
(19,21)-(19,34)
(19,21)-(19,53)
*)

(* type error slice
(16,15)-(16,18)
(16,15)-(16,39)
(16,20)-(16,39)
(17,17)-(17,20)
(17,17)-(17,41)
(17,22)-(17,41)
*)

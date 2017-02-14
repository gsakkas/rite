
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
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
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
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(15,18)-(15,41)
(16,20)-(16,43)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(15,14)-(15,17)
(15,14)-(15,41)
(15,18)-(15,41)
(15,18)-(15,41)
(15,18)-(15,41)
(15,19)-(15,21)
(15,24)-(15,40)
(15,25)-(15,29)
(16,16)-(16,19)
(16,16)-(16,43)
(16,20)-(16,43)
(16,20)-(16,43)
(16,21)-(16,23)
(17,21)-(17,59)
(17,21)-(17,59)
(17,22)-(17,38)
(17,23)-(17,27)
(17,42)-(17,58)
(17,43)-(17,47)
(18,19)-(18,35)
(18,19)-(18,55)
(18,19)-(18,55)
(18,20)-(18,24)
(18,39)-(18,55)
(18,40)-(18,44)
*)

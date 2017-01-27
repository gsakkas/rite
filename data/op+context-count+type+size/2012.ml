
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
  | VarX  -> float_of_int x
  | VarY  -> float_of_int y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) ->
      (float_of_int ((eval (e1, x, y)) + (eval (e2, x, y)))) / 2;;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.;;

*)

(* changed spans
(15,14)-(15,26)
(15,14)-(15,28)
(16,14)-(16,26)
(16,14)-(16,28)
(20,8)-(20,20)
(20,8)-(20,57)
(20,8)-(20,65)
(20,23)-(20,37)
(20,23)-(20,57)
(20,64)-(20,65)
*)

(* type error slice
(14,3)-(20,65)
(15,14)-(15,26)
(15,14)-(15,28)
(15,27)-(15,28)
(16,14)-(16,26)
(16,14)-(16,28)
(16,27)-(16,28)
(17,27)-(17,31)
(17,27)-(17,40)
(17,33)-(17,34)
(17,33)-(17,40)
(17,36)-(17,37)
(17,39)-(17,40)
(20,8)-(20,20)
(20,8)-(20,57)
(20,8)-(20,65)
(20,23)-(20,27)
(20,23)-(20,37)
(20,23)-(20,57)
(20,29)-(20,31)
(20,29)-(20,37)
(20,33)-(20,34)
(20,36)-(20,37)
(20,43)-(20,47)
(20,43)-(20,57)
(20,49)-(20,51)
(20,49)-(20,57)
(20,53)-(20,54)
(20,56)-(20,57)
*)

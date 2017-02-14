
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
  | Sine e -> sin (pi * e)
  | Cosine e -> cos (pi * e)
  | Average (x,y) -> (x +. y) /. 2.0
  | Times (x,y) -> x *. y
  | Thresh (e,f,g,h) -> failwith "sad";;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,3)-(19,39)
(15,15)-(15,26)
(15,20)-(15,26)
(15,25)-(15,26)
(16,17)-(16,28)
(16,22)-(16,28)
(16,27)-(16,28)
(17,23)-(17,29)
(17,23)-(17,37)
(17,34)-(17,37)
(18,20)-(18,21)
(18,25)-(18,26)
(19,25)-(19,33)
(19,25)-(19,39)
(19,34)-(19,39)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(19,39)
(14,3)-(19,39)
(14,3)-(19,39)
(14,3)-(19,39)
(14,3)-(19,39)
(14,3)-(19,39)
(15,15)-(15,18)
(15,15)-(15,26)
(15,20)-(15,22)
(15,20)-(15,26)
(15,20)-(15,26)
(15,20)-(15,26)
(15,25)-(15,26)
(16,17)-(16,20)
(16,17)-(16,28)
(16,22)-(16,24)
(16,22)-(16,28)
(16,22)-(16,28)
(16,22)-(16,28)
(16,27)-(16,28)
(17,23)-(17,24)
(17,23)-(17,29)
(17,23)-(17,29)
(17,28)-(17,29)
(18,20)-(18,21)
(18,20)-(18,26)
(18,20)-(18,26)
(18,25)-(18,26)
*)

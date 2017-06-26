
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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
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
(14,2)-(19,38)
(15,14)-(15,42)
(17,22)-(17,23)
(17,33)-(17,36)
(18,19)-(18,20)
(19,24)-(19,32)
(19,33)-(19,38)
*)

(* type error slice
(14,2)-(19,38)
(17,21)-(17,29)
(17,22)-(17,23)
(17,27)-(17,28)
(18,19)-(18,20)
(18,19)-(18,25)
(18,24)-(18,25)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,38)
(14,2)-(19,38)
(14,8)-(14,9)
(15,14)-(15,42)
(15,14)-(15,17)
(15,18)-(15,42)
(15,19)-(15,21)
(15,25)-(15,41)
(15,26)-(15,30)
(15,31)-(15,40)
(15,32)-(15,33)
(15,35)-(15,36)
(15,38)-(15,39)
(16,16)-(16,44)
(16,16)-(16,19)
(16,20)-(16,44)
(16,21)-(16,23)
(16,27)-(16,43)
(16,28)-(16,32)
(16,33)-(16,42)
(16,34)-(16,35)
(16,37)-(16,38)
(16,40)-(16,41)
(17,21)-(17,36)
(17,21)-(17,29)
(17,22)-(17,23)
(17,27)-(17,28)
(17,33)-(17,36)
(18,19)-(18,25)
(18,19)-(18,20)
(18,24)-(18,25)
(19,24)-(19,38)
(19,24)-(19,32)
(19,33)-(19,38)
*)

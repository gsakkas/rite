
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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((e1 * 1.00) +. (e2 * 1.00)) /. 2.0;;


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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(14,2)-(19,58)
(19,24)-(19,35)
(19,25)-(19,27)
(19,30)-(19,34)
(19,39)-(19,50)
(19,40)-(19,42)
(19,45)-(19,49)
(19,55)-(19,58)
*)

(* type error slice
(14,2)-(19,58)
(19,23)-(19,51)
(19,24)-(19,35)
(19,25)-(19,27)
(19,30)-(19,34)
(19,39)-(19,50)
(19,40)-(19,42)
(19,45)-(19,49)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,58)
(14,2)-(19,58)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,21)
(17,14)-(17,16)
(17,20)-(17,21)
(18,16)-(18,23)
(18,16)-(18,18)
(18,22)-(18,23)
(19,23)-(19,58)
(19,23)-(19,51)
(19,24)-(19,35)
(19,25)-(19,27)
(19,30)-(19,34)
(19,39)-(19,50)
(19,40)-(19,42)
(19,45)-(19,49)
(19,55)-(19,58)
*)

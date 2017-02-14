
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> buildAverage (e1, e2);;


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
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(16,3)-(21,44)
(21,24)-(21,36)
(21,24)-(21,44)
(21,38)-(21,40)
(21,38)-(21,44)
(21,42)-(21,44)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(16,3)-(21,44)
(16,3)-(21,44)
(17,14)-(17,15)
(19,15)-(19,22)
(19,21)-(19,22)
(21,24)-(21,36)
(21,24)-(21,44)
*)

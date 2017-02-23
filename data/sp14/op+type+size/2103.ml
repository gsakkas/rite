
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
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(16,2)-(21,44)
(21,23)-(21,35)
(21,23)-(21,44)
(21,36)-(21,44)
(21,37)-(21,39)
(21,41)-(21,43)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(16,2)-(21,44)
(16,2)-(21,44)
(17,13)-(17,14)
(19,14)-(19,21)
(19,20)-(19,21)
(21,23)-(21,35)
(21,23)-(21,44)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(21,44)
(16,2)-(21,44)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,21)
(19,14)-(19,16)
(19,20)-(19,21)
(20,16)-(20,23)
(20,16)-(20,18)
(20,22)-(20,23)
(21,23)-(21,44)
(21,23)-(21,35)
(21,36)-(21,44)
(21,37)-(21,39)
(21,41)-(21,43)
*)

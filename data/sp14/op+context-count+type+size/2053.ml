
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
  | Average (x,y) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.0
  | Times (x,y) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) -> failwith "sad";;


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
(14,3)-(21,43)
(19,30)-(19,31)
(19,50)-(19,51)
(20,27)-(20,28)
(20,47)-(20,48)
(21,29)-(21,37)
(21,29)-(21,43)
(21,38)-(21,43)
*)

(* type error slice
(13,4)-(21,45)
(13,15)-(21,43)
(14,3)-(21,43)
(14,3)-(21,43)
(14,3)-(21,43)
(14,3)-(21,43)
(14,3)-(21,43)
(14,3)-(21,43)
(15,14)-(15,15)
(17,15)-(17,18)
(17,15)-(17,40)
(17,20)-(17,40)
(17,27)-(17,31)
(17,27)-(17,40)
(17,33)-(17,40)
(17,36)-(17,37)
(18,17)-(18,20)
(18,17)-(18,42)
(19,24)-(19,28)
(19,24)-(19,37)
(19,24)-(19,67)
(19,30)-(19,37)
(19,33)-(19,34)
(20,21)-(20,54)
*)

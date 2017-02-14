
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
(14,2)-(21,42)
(19,29)-(19,30)
(19,49)-(19,50)
(20,26)-(20,27)
(20,46)-(20,47)
(21,28)-(21,36)
(21,28)-(21,42)
(21,37)-(21,42)
*)

(* type error slice
(13,3)-(21,44)
(13,14)-(21,42)
(14,2)-(21,42)
(14,2)-(21,42)
(14,2)-(21,42)
(14,2)-(21,42)
(14,2)-(21,42)
(14,2)-(21,42)
(15,13)-(15,14)
(17,14)-(17,17)
(17,14)-(17,42)
(17,18)-(17,42)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(17,35)-(17,36)
(18,16)-(18,19)
(18,16)-(18,44)
(19,21)-(19,66)
(19,22)-(19,38)
(19,23)-(19,27)
(19,28)-(19,37)
(19,32)-(19,33)
(20,19)-(20,55)
*)

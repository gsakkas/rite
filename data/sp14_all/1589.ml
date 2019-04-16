
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
  | Sine e -> pi *. (eval (e, VarX, VarY))
  | Cosine e -> pi *. (eval (e, VarX, VarY))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | Sine e -> pi *. (eval (e, x, y))
  | Cosine e -> pi *. (eval (e, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,31)-(17,35)
x
VarG

(17,37)-(17,41)
y
VarG

(18,33)-(18,37)
x
VarG

(18,39)-(18,43)
y
VarG

*)

(* type error slice
(13,4)-(24,29)
(13,15)-(24,27)
(14,3)-(24,27)
(15,14)-(15,15)
(17,15)-(17,43)
(17,21)-(17,43)
(17,22)-(17,26)
(17,27)-(17,42)
(17,31)-(17,35)
(18,17)-(18,45)
(19,24)-(19,71)
(19,25)-(19,42)
(19,26)-(19,30)
(19,31)-(19,41)
(19,36)-(19,37)
(20,22)-(20,60)
(22,7)-(24,27)
(24,12)-(24,16)
(24,12)-(24,27)
*)

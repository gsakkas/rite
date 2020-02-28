
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, a1, a2));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,60)-(15,62)
x
VarG

(15,64)-(15,66)
y
VarG

*)

(* type error slice
(12,3)-(15,68)
(14,14)-(14,15)
(14,14)-(14,22)
(15,24)-(15,43)
(15,25)-(15,29)
(15,30)-(15,42)
(15,40)-(15,41)
(15,47)-(15,68)
(15,48)-(15,52)
(15,53)-(15,67)
(15,64)-(15,66)
*)

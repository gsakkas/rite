
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
(15,59)-(15,61)
(15,63)-(15,65)
*)

(* type error slice
(12,2)-(15,67)
(14,13)-(14,14)
(14,13)-(14,21)
(15,23)-(15,42)
(15,24)-(15,28)
(15,29)-(15,41)
(15,39)-(15,40)
(15,46)-(15,67)
(15,47)-(15,51)
(15,52)-(15,66)
(15,63)-(15,65)
*)

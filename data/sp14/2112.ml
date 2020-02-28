
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
  | Average (a1,a2) -> (eval (VarX, x, y)) + (eval (VarY, a1, a2));;


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
(15,24)-(15,67)
eval (VarX , x , y) +. eval (VarY , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(11,4)-(15,69)
(11,15)-(15,67)
(12,3)-(15,67)
(13,14)-(13,22)
(14,14)-(14,15)
(14,14)-(14,22)
(15,24)-(15,43)
(15,24)-(15,67)
(15,25)-(15,29)
(15,30)-(15,42)
(15,40)-(15,41)
(15,46)-(15,67)
(15,47)-(15,51)
(15,52)-(15,66)
(15,63)-(15,65)
*)

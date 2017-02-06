
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
  | Average (a1,a2) -> a1 + a2;;


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
(15,24)-(15,26)
(15,24)-(15,31)
(15,29)-(15,31)
*)

(* type error slice
(11,4)-(15,33)
(11,15)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,3)-(15,31)
(12,9)-(12,10)
(13,14)-(13,15)
(13,14)-(13,22)
(13,14)-(13,22)
(13,19)-(13,22)
(14,14)-(14,15)
(14,14)-(14,22)
(14,14)-(14,22)
(14,19)-(14,22)
(15,24)-(15,26)
(15,24)-(15,31)
(15,24)-(15,31)
(15,24)-(15,31)
(15,29)-(15,31)
*)


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
(15,64)-(15,66)
*)

(* type error slice
(11,15)-(15,66)
(12,3)-(15,66)
(12,3)-(15,66)
(12,3)-(15,66)
(12,3)-(15,66)
(12,9)-(12,10)
(13,14)-(13,15)
(13,14)-(13,22)
(13,14)-(13,22)
(13,19)-(13,22)
(14,14)-(14,15)
(14,14)-(14,22)
(14,14)-(14,22)
(14,19)-(14,22)
(15,25)-(15,29)
(15,25)-(15,41)
(15,25)-(15,41)
(15,31)-(15,35)
(15,31)-(15,41)
(15,37)-(15,38)
(15,40)-(15,41)
(15,48)-(15,52)
(15,48)-(15,66)
(15,48)-(15,66)
(15,54)-(15,58)
(15,54)-(15,66)
(15,60)-(15,62)
(15,64)-(15,66)
*)

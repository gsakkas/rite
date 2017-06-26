
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
(15,23)-(15,66)
(15,58)-(15,60)
(15,62)-(15,64)
*)

(* type error slice
(11,3)-(15,68)
(11,14)-(15,66)
(12,2)-(15,66)
(13,13)-(13,21)
(14,13)-(14,14)
(14,13)-(14,21)
(15,23)-(15,42)
(15,23)-(15,66)
(15,24)-(15,28)
(15,29)-(15,41)
(15,39)-(15,40)
(15,45)-(15,66)
(15,46)-(15,50)
(15,51)-(15,65)
(15,62)-(15,64)
*)

(* all spans
(11,14)-(15,66)
(12,2)-(15,66)
(12,8)-(12,9)
(13,13)-(13,21)
(13,13)-(13,14)
(13,18)-(13,21)
(14,13)-(14,21)
(14,13)-(14,14)
(14,18)-(14,21)
(15,23)-(15,66)
(15,23)-(15,42)
(15,24)-(15,28)
(15,29)-(15,41)
(15,30)-(15,34)
(15,36)-(15,37)
(15,39)-(15,40)
(15,45)-(15,66)
(15,46)-(15,50)
(15,51)-(15,65)
(15,52)-(15,56)
(15,58)-(15,60)
(15,62)-(15,64)
*)

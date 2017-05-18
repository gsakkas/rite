
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
  | Sine s1 -> sin s1
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;


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
  | Sine s1 -> sin (eval (s1, x, y))
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,19)-(15,21)
(16,23)-(16,65)
*)

(* type error slice
(12,2)-(16,65)
(15,15)-(15,18)
(15,15)-(15,21)
(15,19)-(15,21)
*)

(* all spans
(11,14)-(16,65)
(12,2)-(16,65)
(12,8)-(12,9)
(13,13)-(13,21)
(13,13)-(13,14)
(13,18)-(13,21)
(14,13)-(14,21)
(14,13)-(14,14)
(14,18)-(14,21)
(15,15)-(15,21)
(15,15)-(15,18)
(15,19)-(15,21)
(16,23)-(16,65)
(16,23)-(16,42)
(16,24)-(16,28)
(16,29)-(16,41)
(16,30)-(16,34)
(16,36)-(16,37)
(16,39)-(16,40)
(16,46)-(16,65)
(16,47)-(16,51)
(16,52)-(16,64)
(16,53)-(16,57)
(16,59)-(16,60)
(16,62)-(16,63)
*)

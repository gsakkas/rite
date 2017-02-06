
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
(15,20)-(15,22)
(16,25)-(16,64)
(16,54)-(16,58)
(16,60)-(16,61)
(16,63)-(16,64)
*)

(* type error slice
(11,15)-(16,64)
(12,3)-(16,64)
(12,9)-(12,10)
(13,14)-(13,15)
(14,14)-(14,15)
(15,16)-(15,19)
(15,16)-(15,22)
(15,16)-(15,22)
(15,20)-(15,22)
(16,25)-(16,29)
(16,25)-(16,41)
(16,48)-(16,52)
(16,48)-(16,64)
*)

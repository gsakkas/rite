
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
  | Average (a1,a2) -> eval (VarX, a1, a2);;


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
(15,24)-(15,42)
(15,36)-(15,38)
(15,40)-(15,42)
*)

(* type error slice
(11,4)-(15,45)
(11,15)-(15,42)
(12,3)-(15,42)
(14,14)-(14,15)
(14,14)-(14,22)
(15,24)-(15,28)
(15,24)-(15,42)
(15,30)-(15,42)
(15,40)-(15,42)
*)

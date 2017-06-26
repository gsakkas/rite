
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
(15,23)-(15,25)
(15,23)-(15,30)
(15,28)-(15,30)
*)

(* type error slice
(12,2)-(15,30)
(13,13)-(13,21)
(15,23)-(15,25)
(15,23)-(15,30)
(15,28)-(15,30)
*)

(* all spans
(11,14)-(15,30)
(12,2)-(15,30)
(12,8)-(12,9)
(13,13)-(13,21)
(13,13)-(13,14)
(13,18)-(13,21)
(14,13)-(14,21)
(14,13)-(14,14)
(14,18)-(14,21)
(15,23)-(15,30)
(15,23)-(15,25)
(15,28)-(15,30)
*)

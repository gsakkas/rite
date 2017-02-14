
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
  | VarX  -> x
  | VarY  -> y
  | Average (x',y') -> ((eval x') + (eval y')) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(12,2)-(15,50)
(13,13)-(13,14)
(15,23)-(15,46)
(15,23)-(15,50)
(15,24)-(15,33)
(15,25)-(15,29)
(15,30)-(15,32)
(15,36)-(15,45)
(15,49)-(15,50)
*)

(* type error slice
(11,3)-(15,52)
(11,14)-(15,50)
(12,2)-(15,50)
(15,24)-(15,33)
(15,25)-(15,29)
(15,30)-(15,32)
*)

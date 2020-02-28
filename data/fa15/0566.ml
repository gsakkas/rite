
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
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) / 2;;


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
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> (eval (e1, x, y)) +. (eval (e2, x, y));;

*)

(* changed spans
(17,24)-(17,68)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(12,3)-(17,68)
(15,16)-(15,19)
(15,16)-(15,37)
(17,24)-(17,64)
(17,24)-(17,68)
*)

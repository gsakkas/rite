
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
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) / 2.0
  | Cosine e1 -> cos (3.142 *. (eval (e1, x, y)))
  | Sine e1 -> sin (3.142 *. (eval (e1, x, y)))
  | VarY  -> y
  | VarX  -> x;;


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
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Cosine e1 -> cos (3.142 *. (eval (e1, x, y)))
  | Sine e1 -> sin (3.142 *. (eval (e1, x, y)))
  | VarY  -> y
  | VarX  -> x;;

*)

(* changed spans
(18,24)-(18,70)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(12,3)-(22,15)
(14,7)-(16,27)
(16,12)-(16,16)
(16,12)-(16,27)
(17,22)-(17,39)
(17,22)-(17,60)
(17,23)-(17,27)
(18,24)-(18,64)
(18,24)-(18,70)
(18,67)-(18,70)
*)


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
(18,23)-(18,69)
*)

(* type error slice
(12,2)-(22,14)
(12,2)-(22,14)
(14,6)-(16,26)
(16,11)-(16,15)
(16,11)-(16,26)
(17,21)-(17,38)
(17,21)-(17,59)
(17,22)-(17,26)
(18,23)-(18,63)
(18,23)-(18,69)
(18,23)-(18,69)
(18,23)-(18,69)
(18,66)-(18,69)
*)

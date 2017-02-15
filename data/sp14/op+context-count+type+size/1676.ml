
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
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) /. 2) + ((eval (e2, x, y)) /. 2)
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) /. 2.0) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,23)-(17,74)
(17,45)-(17,46)
(17,72)-(17,73)
(18,21)-(18,38)
(18,21)-(18,58)
*)

(* type error slice
(15,14)-(15,17)
(15,14)-(15,34)
(15,18)-(15,34)
(15,19)-(15,23)
(17,23)-(17,47)
(17,23)-(17,47)
(17,23)-(17,74)
(17,23)-(17,74)
(17,45)-(17,46)
(17,50)-(17,74)
(17,50)-(17,74)
(17,72)-(17,73)
(18,21)-(18,38)
(18,21)-(18,58)
(18,21)-(18,58)
(18,22)-(18,26)
(18,41)-(18,58)
(18,42)-(18,46)
*)


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
(17,26)-(17,74)
(17,46)-(17,47)
(17,73)-(17,74)
(18,23)-(18,37)
(18,23)-(18,57)
*)

(* type error slice
(12,3)-(22,26)
(13,14)-(13,15)
(15,20)-(15,24)
(15,20)-(15,33)
(15,26)-(15,27)
(15,26)-(15,33)
(15,29)-(15,30)
(15,32)-(15,33)
(17,26)-(17,47)
(17,26)-(17,74)
(17,46)-(17,47)
(17,53)-(17,74)
(17,73)-(17,74)
(18,23)-(18,27)
(18,23)-(18,37)
(18,23)-(18,57)
(18,29)-(18,31)
(18,29)-(18,37)
(18,33)-(18,34)
(18,36)-(18,37)
(18,43)-(18,47)
(18,43)-(18,57)
(18,49)-(18,51)
(18,49)-(18,57)
(18,53)-(18,54)
(18,56)-(18,57)
*)

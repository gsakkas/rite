
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
      ((eval (e1, x, y)) /. 2.0) + ((eval (e2, x, y)) /. 2.0)
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
(18,7)-(18,62)
(eval (e1 , x , y) /. 2.0) +. (eval (e2 , x , y) /. 2.0)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(19,22)-(19,59)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(15,15)-(15,18)
(15,15)-(15,35)
(15,19)-(15,35)
(15,20)-(15,24)
(18,7)-(18,33)
(18,7)-(18,62)
(18,36)-(18,62)
(19,22)-(19,39)
(19,22)-(19,59)
(19,23)-(19,27)
(19,42)-(19,59)
(19,43)-(19,47)
*)

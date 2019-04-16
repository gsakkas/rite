
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | MyExpr1 (e1,e2,e3) -> ((sqrt e1) *. (sqrt e2)) *. e3
  | MyExpr2 e -> e *. 0.5;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | MyExpr1 (e1,e2,e3) ->
      ((sqrt (eval (e1, x, y))) *. (sqrt (eval (e2, x, y)))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> (eval (e, x, y)) *. 0.5;;

*)

(* changed spans
(27,34)-(27,36)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,47)-(27,49)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,55)-(27,57)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,18)-(28,19)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(16,3)-(28,26)
(27,27)-(27,57)
(27,28)-(27,37)
(27,29)-(27,33)
(27,34)-(27,36)
(27,41)-(27,50)
(27,42)-(27,46)
(27,47)-(27,49)
(27,55)-(27,57)
(28,18)-(28,19)
(28,18)-(28,26)
*)

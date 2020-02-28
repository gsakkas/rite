
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ThreshRev of expr* expr* expr* expr
  | Square of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin ((eval (e1, x, y)) *. pi)
  | Cosine e1 -> cos ((eval (e1, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | ThreshRev (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e1 -> e1 *. e1;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ThreshRev of expr* expr* expr* expr
  | Square of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin ((eval (e1, x, y)) *. pi)
  | Cosine e1 -> cos ((eval (e1, x, y)) *. pi)
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | ThreshRev (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e1 -> (eval (e1, x, y)) *. (eval (e1, x, y));;

*)

(* changed spans
(31,18)-(31,20)
eval (e1 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(31,24)-(31,26)
eval (e1 , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(16,3)-(31,26)
(31,18)-(31,20)
(31,18)-(31,26)
(31,24)-(31,26)
*)

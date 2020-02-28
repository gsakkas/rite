
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Foo of expr* expr
  | Clamp of expr* expr* expr;;

let a = (1, 2);;

let (c,d) = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> cos ((eval (a, x, y)) *. pi)
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Foo (a,b) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then 0.9 *. (eval (a, x, y))
      else (eval 0.1) *. (a, x, y)
  | Clamp (a,b,c) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (b, x, y)
      else
        if (eval (a, x, y)) > (eval (c, x, y))
        then eval (c, x, y)
        else eval (a, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Foo of expr* expr
  | Clamp of expr* expr* expr;;

let a = (1, 2);;

let (c,d) = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> cos ((eval (a, x, y)) *. pi)
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Foo (a,b) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then 0.9 *. (eval (a, x, y))
      else 0.1 *. (eval (a, x, y))
  | Clamp (a,b,c) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (b, x, y)
      else
        if (eval (a, x, y)) > (eval (c, x, y))
        then eval (c, x, y)
        else eval (a, x, y);;

*)

(* changed spans
(34,12)-(34,22)
0.1
LitG

(34,26)-(34,35)
eval (a , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(23,20)-(23,36)
(23,21)-(23,25)
(23,26)-(23,35)
(34,12)-(34,22)
(34,12)-(34,35)
(34,13)-(34,17)
(34,18)-(34,21)
(34,26)-(34,35)
*)

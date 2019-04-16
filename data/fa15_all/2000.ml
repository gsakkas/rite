
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) ->
      let d = eval (n, x, y) in
      if d > 1.0
      then eval (m, x, y)
      else (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = (eval (m, x, y)) * (eval (n, x, y)) in
      if d > 0.0 then d /. d else d /. (eval (o, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) ->
      let d = eval (n, x, y) in
      if d > 1.0
      then eval (m, x, y)
      else (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = (eval (m, x, y)) *. (eval (n, x, y)) in
      if d > 0.0 then d /. d else d /. (eval (o, x, y));;

*)

(* changed spans
(33,15)-(33,50)
eval (m , x , y) *. eval (n , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(33,7)-(34,56)
(33,15)-(33,31)
(33,15)-(33,50)
(33,16)-(33,20)
(33,34)-(33,50)
(33,35)-(33,39)
(34,10)-(34,11)
(34,10)-(34,17)
(34,14)-(34,17)
(34,23)-(34,24)
(34,23)-(34,29)
(34,28)-(34,29)
(34,35)-(34,36)
(34,35)-(34,56)
*)

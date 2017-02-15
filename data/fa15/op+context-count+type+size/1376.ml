
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
      let d = (eval (m, x, y)) ** (eval (n, x, y)) in
      if (d > 1.0) || (d < (-1.0)) then 1.0
  | Op (m,n,o) ->
      let d =
        (((eval (m, x, y)) *. (eval (n, x, y))) *. (eval (o, x, y))) /.
          (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y))) in
      if d > 1.0 then 1.0 else if d < (-1.0) then (-1.0) else d;;


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
      let d =
        (((eval (m, x, y)) *. (eval (n, x, y))) *. (eval (o, x, y))) /.
          (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y))) in
      if d > 1.0 then 1.0 else if d < (-1.0) then (-1.0) else d;;

*)

(* changed spans
(28,14)-(28,50)
(29,6)-(29,43)
(29,9)-(29,18)
(29,9)-(29,34)
(29,10)-(29,11)
(29,14)-(29,17)
(29,22)-(29,34)
(29,23)-(29,24)
(29,27)-(29,33)
(29,29)-(29,32)
(29,40)-(29,43)
(31,6)-(34,63)
(34,40)-(34,43)
(34,52)-(34,55)
*)

(* type error slice
(28,6)-(29,43)
(28,14)-(28,50)
(28,31)-(28,33)
(29,6)-(29,43)
(29,6)-(29,43)
(29,6)-(29,43)
(29,22)-(29,34)
(29,22)-(29,34)
(29,23)-(29,24)
(29,27)-(29,33)
(29,27)-(29,33)
(29,29)-(29,32)
(29,40)-(29,43)
(31,6)-(34,63)
(32,8)-(33,70)
(34,6)-(34,63)
(34,6)-(34,63)
(34,22)-(34,25)
(34,31)-(34,63)
(34,31)-(34,63)
(34,34)-(34,35)
(34,34)-(34,44)
(34,34)-(34,44)
(34,38)-(34,44)
(34,38)-(34,44)
(34,40)-(34,43)
(34,50)-(34,56)
(34,50)-(34,56)
(34,52)-(34,55)
(34,62)-(34,63)
*)

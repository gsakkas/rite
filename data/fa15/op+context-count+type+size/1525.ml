
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
(28,16)-(28,49)
(29,7)-(29,44)
(29,11)-(29,12)
(29,11)-(29,18)
(29,11)-(29,33)
(29,15)-(29,18)
(29,24)-(29,25)
(29,24)-(29,33)
(29,29)-(29,33)
(29,30)-(29,33)
(29,41)-(29,44)
(31,7)-(34,64)
(34,41)-(34,44)
(34,53)-(34,56)
*)

(* type error slice
(28,7)-(29,44)
(28,16)-(28,49)
(28,32)-(28,34)
(29,7)-(29,44)
(29,7)-(29,44)
(29,7)-(29,44)
(29,24)-(29,25)
(29,24)-(29,33)
(29,24)-(29,33)
(29,29)-(29,33)
(29,29)-(29,33)
(29,30)-(29,33)
(29,41)-(29,44)
(31,7)-(34,64)
(32,12)-(33,68)
(34,7)-(34,64)
(34,7)-(34,64)
(34,23)-(34,26)
(34,32)-(34,64)
(34,32)-(34,64)
(34,35)-(34,36)
(34,35)-(34,44)
(34,35)-(34,44)
(34,40)-(34,44)
(34,40)-(34,44)
(34,41)-(34,44)
(34,52)-(34,56)
(34,52)-(34,56)
(34,53)-(34,56)
(34,63)-(34,64)
*)


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
        (((eval (m, x, y)) * (eval (n, x, y))) * (eval (o, x, y))) /
          (((eval (m, x, y)) + (eval (n, x, y))) + (eval (o, x, y))) in
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
(34,12)-(34,25)
(34,12)-(34,44)
(34,12)-(34,64)
(34,12)-(35,66)
(35,14)-(35,27)
(35,14)-(35,46)
(35,14)-(35,66)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(33,7)-(36,64)
(34,12)-(34,16)
(34,12)-(34,25)
(34,12)-(34,44)
(34,12)-(34,44)
(34,12)-(34,64)
(34,12)-(35,66)
(34,31)-(34,35)
(34,31)-(34,44)
(34,51)-(34,55)
(34,51)-(34,64)
(35,14)-(35,18)
(35,14)-(35,27)
(35,14)-(35,46)
(35,14)-(35,46)
(35,14)-(35,66)
(35,33)-(35,37)
(35,33)-(35,46)
(35,53)-(35,57)
(35,53)-(35,66)
(36,7)-(36,64)
(36,7)-(36,64)
(36,10)-(36,11)
(36,10)-(36,17)
(36,10)-(36,17)
(36,14)-(36,17)
(36,23)-(36,26)
(36,32)-(36,64)
(36,40)-(36,44)
(36,41)-(36,44)
(36,52)-(36,56)
(36,52)-(36,56)
(36,53)-(36,56)
*)

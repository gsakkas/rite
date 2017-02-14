
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
(34,8)-(34,66)
(34,8)-(35,68)
(34,9)-(34,46)
(34,10)-(34,26)
(35,10)-(35,68)
(35,11)-(35,48)
(35,12)-(35,28)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(33,6)-(36,63)
(34,8)-(35,68)
(34,9)-(34,46)
(34,9)-(34,46)
(34,10)-(34,26)
(34,11)-(34,15)
(34,29)-(34,45)
(34,30)-(34,34)
(35,11)-(35,48)
(35,11)-(35,48)
(35,12)-(35,28)
(35,13)-(35,17)
(35,31)-(35,47)
(35,32)-(35,36)
(36,6)-(36,63)
(36,6)-(36,63)
(36,9)-(36,10)
(36,9)-(36,16)
(36,9)-(36,16)
(36,13)-(36,16)
(36,22)-(36,25)
(36,31)-(36,63)
(36,38)-(36,44)
(36,40)-(36,43)
(36,50)-(36,56)
(36,50)-(36,56)
(36,52)-(36,55)
*)

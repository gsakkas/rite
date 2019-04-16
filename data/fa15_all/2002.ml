
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
(34,9)-(35,69)
((eval (m , x , y) *. eval (n , x , y)) *. eval (o , x , y)) /. ((eval (m , x , y) +. eval (n , x , y)) +. eval (o , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(33,7)-(36,64)
(34,9)-(35,69)
(34,10)-(34,47)
(34,11)-(34,27)
(34,12)-(34,16)
(34,30)-(34,46)
(34,31)-(34,35)
(35,12)-(35,49)
(35,13)-(35,29)
(35,14)-(35,18)
(35,32)-(35,48)
(35,33)-(35,37)
(36,10)-(36,11)
(36,10)-(36,17)
(36,14)-(36,17)
(36,32)-(36,64)
(36,35)-(36,36)
(36,35)-(36,45)
(36,39)-(36,45)
(36,41)-(36,44)
(36,51)-(36,57)
(36,53)-(36,56)
(36,63)-(36,64)
*)

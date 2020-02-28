
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
  | Power (m,n) -> (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = ((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)) in
      (sqrt (sqrt (d * d))) /. 3.0;;


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
  | Power (m,n) -> (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = ((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)) in
      (sqrt (sqrt (d *. d))) /. 3.0;;

*)

(* changed spans
(30,19)-(30,26)
d *. d
BopG VarG VarG

*)

(* type error slice
(29,7)-(30,35)
(29,15)-(29,73)
(30,13)-(30,27)
(30,14)-(30,18)
(30,19)-(30,26)
(30,20)-(30,21)
(30,24)-(30,25)
*)

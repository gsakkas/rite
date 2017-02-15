
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
      if d < 0
      then (eval (m, x, y)) ** (d *. (-1.0))
      else (eval (m, x, y)) ** d
  | Op (m,n,o) ->
      (sqrt (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)))) /.
        3.0;;


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
      if d < 0.0
      then (eval (m, x, y)) ** (d *. (-1.0))
      else (eval (m, x, y)) ** d
  | Op (m,n,o) ->
      (sqrt (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)))) /.
        3.0;;

*)

(* changed spans
(29,13)-(29,14)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(28,6)-(31,32)
(28,14)-(28,18)
(28,14)-(28,28)
(29,9)-(29,10)
(29,9)-(29,14)
(29,9)-(29,14)
(29,13)-(29,14)
(30,31)-(30,44)
(30,37)-(30,43)
(30,37)-(30,43)
(30,39)-(30,42)
*)

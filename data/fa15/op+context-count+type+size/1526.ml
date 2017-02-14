
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
      (sqrt
         (abs (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)))))
        /. 3.0;;


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
      (sqrt (d ** d)) /. 3.0;;

*)

(* changed spans
(29,6)-(30,76)
(29,6)-(31,14)
(29,7)-(29,11)
(30,9)-(30,75)
(30,10)-(30,13)
(31,11)-(31,14)
*)

(* type error slice
(30,9)-(30,75)
(30,10)-(30,13)
(30,14)-(30,74)
*)

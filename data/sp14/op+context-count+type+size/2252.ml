
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Halve of expr
  | Average of expr* expr
  | Times of expr* expr
  | Wow of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine u -> sin (pi *. (eval (u, x, y)))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y)
  | Halve u -> (eval (u, x, y)) /. 2
  | Wow (u,v,w) ->
      sqrt
        (((abs (eval (u, x, y))) *. (abs (eval (v, x, y)))) *.
           (abs (eval (w, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Halve of expr
  | Average of expr* expr
  | Times of expr* expr
  | Wow of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine u -> sin (pi *. (eval (u, x, y)))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y)
  | Halve u -> (eval (u, x, y)) /. 2.0
  | Wow (u,v,w) ->
      sqrt
        (((abs_float (eval (u, x, y))) *. (abs_float (eval (v, x, y)))) *.
           (abs_float (eval (w, x, y))));;

*)

(* changed spans
(27,35)-(27,36)
(30,11)-(30,14)
(30,37)-(30,40)
(31,12)-(31,15)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(27,15)-(27,36)
(27,35)-(27,36)
(30,10)-(30,32)
(30,11)-(30,14)
(30,15)-(30,31)
(30,16)-(30,20)
(30,36)-(30,58)
(30,37)-(30,40)
(30,41)-(30,57)
(30,42)-(30,46)
(31,11)-(31,33)
(31,12)-(31,15)
(31,16)-(31,32)
(31,17)-(31,21)
*)

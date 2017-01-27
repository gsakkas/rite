
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
(30,12)-(30,15)
(30,38)-(30,41)
(31,13)-(31,16)
*)

(* type error slice
(16,3)-(31,31)
(19,27)-(19,31)
(19,27)-(19,40)
(19,33)-(19,34)
(19,33)-(19,40)
(19,36)-(19,37)
(19,39)-(19,40)
(30,12)-(30,15)
(30,12)-(30,30)
(30,17)-(30,21)
(30,17)-(30,30)
(30,23)-(30,24)
(30,23)-(30,30)
(30,26)-(30,27)
(30,29)-(30,30)
(30,38)-(30,41)
(30,38)-(30,56)
(30,43)-(30,47)
(30,43)-(30,56)
(30,49)-(30,50)
(30,49)-(30,56)
(30,52)-(30,53)
(30,55)-(30,56)
(31,13)-(31,16)
(31,13)-(31,31)
(31,18)-(31,22)
(31,18)-(31,31)
(31,24)-(31,25)
(31,24)-(31,31)
(31,27)-(31,28)
(31,30)-(31,31)
*)

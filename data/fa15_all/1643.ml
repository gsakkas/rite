
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
2.0
LitG

(30,11)-(30,14)
abs_float
VarG

(30,37)-(30,40)
abs_float
VarG

(31,12)-(31,15)
abs_float
VarG

*)

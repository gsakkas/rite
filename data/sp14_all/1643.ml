
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
(27,36)-(27,37)
2.0
LitG

(30,11)-(30,33)
abs_float (eval (u , x , y))
AppG [AppG [EmptyG]]

(30,37)-(30,59)
abs_float (eval (v , x , y))
AppG [AppG [EmptyG]]

(31,12)-(31,34)
abs_float (eval (w , x , y))
AppG [AppG [EmptyG]]

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(27,16)-(27,37)
(27,36)-(27,37)
(30,11)-(30,33)
(30,12)-(30,15)
(30,16)-(30,32)
(30,17)-(30,21)
(30,37)-(30,59)
(30,38)-(30,41)
(30,42)-(30,58)
(30,43)-(30,47)
(31,12)-(31,34)
(31,13)-(31,16)
(31,17)-(31,33)
(31,18)-(31,22)
*)

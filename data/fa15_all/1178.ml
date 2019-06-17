
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> ((eval (c, x, y)) +. (eval (d, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y)
  | Funny (k,l,m) ->
      ((eval (k, x, y)) +. (eval (l, x, y))) +. (eval (m, x, y))
  | Funny1 n -> (sqrt (abs_float (eval (n, x, y)))) / 1000.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> ((eval (c, x, y)) +. (eval (d, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y)
  | Funny (k,l,m) ->
      ((eval (k, x, y)) +. (eval (l, x, y))) +. (eval (m, x, y))
  | Funny1 n -> (sqrt (abs_float (eval (n, x, y)))) /. 1000.0;;

*)

(* changed spans
(29,17)-(29,61)
sqrt (abs_float (eval (n , x , y))) /. 1000.0
BopG (AppG [EmptyG]) LitG

*)

(* type error slice
(16,3)-(29,61)
(19,15)-(19,18)
(19,15)-(19,43)
(29,17)-(29,52)
(29,17)-(29,61)
(29,18)-(29,22)
(29,55)-(29,61)
*)

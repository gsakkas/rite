
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((sin (pi * (eval (r, x, y)))) + (tan (pi * (eval (s, x, y))))) *
        (sin (pi * (eval (t, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((sin (pi *. (eval (r, x, y)))) +. (tan (pi *. (eval (s, x, y))))) *.
        (sin (pi *. (eval (t, x, y))));;

*)

(* changed spans
(27,6)-(27,69)
(sin (pi *. eval (r , x , y)) +. tan (pi *. eval (s , x , y))) *. sin (pi *. eval (t , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(27,7)-(27,36)
sin (pi *. eval (r , x , y)) +. tan (pi *. eval (s , x , y))
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,12)-(27,35)
pi *. eval (r , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(27,44)-(27,67)
pi *. eval (s , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(28,13)-(28,36)
pi *. eval (t , x , y)
BopG VarG (AppG (fromList [EmptyG]))

*)

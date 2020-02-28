
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | NewA (a,b) ->
      (sin (pi *. (eval (a, x, y)))) *. (cos (pi *. (eval (b, x, y))))
  | NewB (a,b,c) ->
      (((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y))) exp 0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | NewA (a,b) ->
      (sin (pi *. (eval (a, x, y)))) *. (cos (pi *. (eval (b, x, y))))
  | NewB (a,b,c) ->
      (((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y))) -.
        (((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y)));;

*)

(* changed spans
(30,7)-(30,73)
((eval (a , x , y) +. eval (b , x , y)) +. eval (c , x , y)) -. ((eval (a , x , y) +. eval (b , x , y)) +. eval (c , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(30,7)-(30,67)
(30,7)-(30,73)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> (eval (c, x, y)) +. ((eval (d, x, y)) /. 2)
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> (eval (c, x, y)) +. ((eval (d, x, y)) /. 2.0)
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y);;

*)

(* changed spans
(19,63)-(19,64)
2.0
LitG

*)

(* type error slice
(19,42)-(19,65)
(19,63)-(19,64)
*)

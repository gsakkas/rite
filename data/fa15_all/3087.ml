
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Root of expr
  | Average of expr* expr
  | Times of expr* expr
  | Pivot of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Root x3 -> sqrt (eval (x3, x, y))
  | Average (x4,x5) -> ((eval (x4, x, y)) +. (eval (x5, x, y))) /. 2.
  | Times (x6,x7) -> (eval (x6, x, y)) *. (eval (x7, x, y))
  | Thresh (x8,x9,x10,x11) ->
      if (eval (x8, x, y)) < (eval (x9, x, y))
      then eval (x10, x, y)
      else eval (x11, x, y)
  | Pivot (x12,x13,x14) ->
      if (eval (x12, x, y)) < 0 then eval (x13, x, y) else eval (x14, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Root of expr
  | Average of expr* expr
  | Times of expr* expr
  | Pivot of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Root x3 -> sqrt (eval (x3, x, y))
  | Average (x4,x5) -> ((eval (x4, x, y)) +. (eval (x5, x, y))) /. 2.
  | Times (x6,x7) -> (eval (x6, x, y)) *. (eval (x7, x, y))
  | Thresh (x8,x9,x10,x11) ->
      if (eval (x8, x, y)) < (eval (x9, x, y))
      then eval (x10, x, y)
      else eval (x11, x, y)
  | Pivot (x12,x13,x14) ->
      if (eval (x12, x, y)) < 0. then eval (x13, x, y) else eval (x14, x, y);;

*)

(* changed spans
(29,30)-(29,31)
0.0
LitG

*)

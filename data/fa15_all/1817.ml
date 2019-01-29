
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | AbsThresh of expr* expr* expr
  | ModThresh of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | AbsThresh (e1,e2,e3) ->
      let s = eval (e3, x, y) in
      if (abs_float (eval (e1, x, y))) < (abs_float (eval (e2, x, y)))
      then s
      else abs_float s
  | ModThresh (e1,e2,e3) ->
      if ((truncate (100 *. (eval (e1, x, y)))) mod 5) = 0
      then eval (e2, x, y)
      else eval (e3, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | AbsThresh of expr* expr* expr
  | ModThresh of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | AbsThresh (e1,e2,e3) ->
      let s = eval (e3, x, y) in
      if (abs_float (eval (e1, x, y))) < (abs_float (eval (e2, x, y)))
      then s
      else abs_float s
  | ModThresh (e1,e2,e3) ->
      if ((truncate (100. *. (eval (e1, x, y)))) mod 5) = 0
      then eval (e2, x, y)
      else eval (e3, x, y);;

*)

(* changed spans
(33,21)-(33,24)
100.0
LitG

*)

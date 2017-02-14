
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
  | Poly (a,b,c) ->
      (eval ((a, x, y) *. (a, x, y))) + ((b, x, y) *. (c, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
  | Poly (a,b,c) ->
      ((eval (a, x, y)) *. (eval (a, x, y))) +.
        ((eval (b, x, y)) *. (eval (c, x, y)));;

*)

(* changed spans
(28,8)-(28,35)
(28,8)-(28,63)
(28,15)-(28,35)
(28,28)-(28,35)
(28,43)-(28,50)
(28,56)-(28,57)
(28,56)-(28,63)
(28,59)-(28,60)
(28,62)-(28,63)
*)

(* type error slice
(16,3)-(28,63)
(16,3)-(28,63)
(19,15)-(19,18)
(19,15)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(19,33)-(19,40)
(28,8)-(28,12)
(28,8)-(28,35)
(28,8)-(28,63)
(28,8)-(28,63)
(28,15)-(28,22)
(28,15)-(28,35)
(28,15)-(28,35)
(28,15)-(28,35)
(28,28)-(28,35)
(28,43)-(28,50)
(28,43)-(28,63)
(28,43)-(28,63)
(28,43)-(28,63)
(28,56)-(28,63)
*)

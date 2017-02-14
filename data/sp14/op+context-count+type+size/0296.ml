
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
(28,6)-(28,37)
(28,6)-(28,64)
(28,12)-(28,36)
(28,26)-(28,35)
(28,41)-(28,50)
(28,54)-(28,63)
(28,55)-(28,56)
(28,58)-(28,59)
(28,61)-(28,62)
*)

(* type error slice
(16,2)-(28,64)
(16,2)-(28,64)
(19,14)-(19,17)
(19,14)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(28,6)-(28,37)
(28,6)-(28,64)
(28,6)-(28,64)
(28,7)-(28,11)
(28,12)-(28,36)
(28,12)-(28,36)
(28,12)-(28,36)
(28,13)-(28,22)
(28,26)-(28,35)
(28,40)-(28,64)
(28,40)-(28,64)
(28,40)-(28,64)
(28,41)-(28,50)
(28,54)-(28,63)
*)

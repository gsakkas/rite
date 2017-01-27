
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
(17,14)-(17,15)
(19,27)-(19,31)
(19,27)-(19,40)
(19,33)-(19,34)
(19,33)-(19,40)
(19,36)-(19,37)
(19,39)-(19,40)
(28,8)-(28,12)
(28,8)-(28,35)
(28,8)-(28,63)
(28,15)-(28,16)
(28,15)-(28,22)
(28,15)-(28,35)
(28,18)-(28,19)
(28,21)-(28,22)
(28,28)-(28,29)
(28,28)-(28,35)
(28,31)-(28,32)
(28,34)-(28,35)
(28,43)-(28,44)
(28,43)-(28,50)
(28,43)-(28,63)
(28,46)-(28,47)
(28,49)-(28,50)
(28,56)-(28,57)
(28,56)-(28,63)
(28,59)-(28,60)
(28,62)-(28,63)
*)

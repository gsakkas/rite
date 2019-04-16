
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

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
  | SquareAv (a,b) -> ((a *. a) +. (b *. b)) / 2.0
  | MultHalf (a,b,c) -> ((a *. b) *. c) / 2.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

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
  | SquareAv (a,b) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (b, x, y))))
        /. 2.0
  | MultHalf (a,b,c) ->
      (((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))) /. 2.0;;

*)

(* changed spans
(27,23)-(27,51)
((eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (b , x , y))) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(28,25)-(28,46)
((eval (a , x , y) *. eval (b , x , y)) *. eval (c , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(16,3)-(28,46)
(19,15)-(19,18)
(19,15)-(19,43)
(27,23)-(27,45)
(27,23)-(27,51)
(27,24)-(27,32)
(27,25)-(27,26)
(27,30)-(27,31)
(27,36)-(27,44)
(27,37)-(27,38)
(27,42)-(27,43)
(27,48)-(27,51)
(28,25)-(28,40)
(28,25)-(28,46)
(28,26)-(28,34)
(28,27)-(28,28)
(28,32)-(28,33)
(28,38)-(28,39)
(28,43)-(28,46)
*)

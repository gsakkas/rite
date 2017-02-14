
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
(27,22)-(27,50)
(27,24)-(27,25)
(27,29)-(27,30)
(27,35)-(27,43)
(27,36)-(27,37)
(27,41)-(27,42)
(27,47)-(27,50)
(28,24)-(28,39)
(28,24)-(28,45)
(28,25)-(28,33)
(28,26)-(28,27)
(28,31)-(28,32)
(28,37)-(28,38)
(28,42)-(28,45)
*)

(* type error slice
(16,2)-(28,45)
(16,2)-(28,45)
(16,2)-(28,45)
(16,2)-(28,45)
(16,2)-(28,45)
(16,2)-(28,45)
(16,2)-(28,45)
(16,2)-(28,45)
(19,14)-(19,17)
(19,14)-(19,42)
(27,22)-(27,44)
(27,22)-(27,50)
(27,22)-(27,50)
(27,22)-(27,50)
(27,23)-(27,31)
(27,23)-(27,31)
(27,24)-(27,25)
(27,29)-(27,30)
(27,35)-(27,43)
(27,35)-(27,43)
(27,36)-(27,37)
(27,41)-(27,42)
(27,47)-(27,50)
(28,24)-(28,39)
(28,24)-(28,39)
(28,24)-(28,45)
(28,24)-(28,45)
(28,24)-(28,45)
(28,25)-(28,33)
(28,25)-(28,33)
(28,26)-(28,27)
(28,31)-(28,32)
(28,37)-(28,38)
(28,42)-(28,45)
*)

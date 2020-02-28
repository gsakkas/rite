
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      eval
        ((eval (a, (sin (pi * x)), (sin (pi * y)))),
          (eval (b, (sin (pi * x)), (sin (pi * y)))),
          (eval (c, (sin (pi * x)), (sin (pi * y)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      (((eval (a, (sin (pi *. x)), (sin (pi *. y)))) +.
          (eval (b, (sin (pi *. x)), (sin (pi *. y)))))
         +. (eval (c, (sin (pi *. x)), (sin (pi *. y)))))
        /. 3.0;;

*)

(* changed spans
(29,7)-(32,54)
((eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))) +. eval (c , sin (pi *. x) , sin (pi *. y))) /. 3.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,27)
(16,3)-(32,54)
(19,15)-(19,19)
(19,15)-(19,57)
(19,20)-(19,57)
(19,21)-(19,22)
(19,29)-(19,38)
(19,36)-(19,37)
(19,46)-(19,55)
(19,53)-(19,54)
(21,22)-(21,60)
(21,23)-(21,39)
(21,24)-(21,28)
(29,7)-(29,11)
(29,7)-(32,54)
(30,9)-(32,54)
(30,10)-(30,52)
(30,11)-(30,15)
(30,20)-(30,34)
(30,21)-(30,24)
(30,25)-(30,33)
(30,26)-(30,28)
(30,31)-(30,32)
(30,36)-(30,50)
(30,37)-(30,40)
(30,41)-(30,49)
(30,42)-(30,44)
(30,47)-(30,48)
(31,21)-(31,35)
(31,22)-(31,25)
(31,26)-(31,34)
(31,27)-(31,29)
(31,32)-(31,33)
(31,37)-(31,51)
(31,38)-(31,41)
(31,42)-(31,50)
(31,43)-(31,45)
(31,48)-(31,49)
(32,21)-(32,35)
(32,22)-(32,25)
(32,26)-(32,34)
(32,27)-(32,29)
(32,32)-(32,33)
(32,37)-(32,51)
(32,38)-(32,41)
(32,42)-(32,50)
(32,43)-(32,45)
(32,48)-(32,49)
*)

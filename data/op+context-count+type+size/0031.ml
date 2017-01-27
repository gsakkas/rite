
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
      (((eval (a, (sin (pi *. x)), (sin (pi *. y)))) +
          (eval (b, (sin (pi *. x)), (sin (pi *. y)))))
         + (eval (c, (sin (pi *. x)), (sin (pi *. y)))))
        /. 3.0;;


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
(29,10)-(29,49)
(29,10)-(30,51)
(29,10)-(31,52)
*)

(* type error slice
(16,3)-(32,15)
(19,15)-(19,19)
(19,15)-(19,54)
(19,21)-(19,22)
(19,21)-(19,54)
(19,25)-(19,28)
(19,25)-(19,37)
(19,30)-(19,37)
(19,42)-(19,45)
(19,42)-(19,54)
(19,47)-(19,54)
(29,10)-(29,14)
(29,10)-(29,49)
(29,10)-(30,51)
(29,10)-(31,52)
(29,10)-(32,15)
(29,16)-(29,17)
(29,16)-(29,49)
(29,20)-(29,23)
(29,20)-(29,32)
(29,25)-(29,32)
(29,37)-(29,40)
(29,37)-(29,49)
(29,42)-(29,49)
(30,12)-(30,16)
(30,12)-(30,51)
(30,18)-(30,19)
(30,18)-(30,51)
(30,22)-(30,25)
(30,22)-(30,34)
(30,27)-(30,34)
(30,39)-(30,42)
(30,39)-(30,51)
(30,44)-(30,51)
(31,13)-(31,17)
(31,13)-(31,52)
(31,19)-(31,20)
(31,19)-(31,52)
(31,23)-(31,26)
(31,23)-(31,35)
(31,28)-(31,35)
(31,40)-(31,43)
(31,40)-(31,52)
(31,45)-(31,52)
*)

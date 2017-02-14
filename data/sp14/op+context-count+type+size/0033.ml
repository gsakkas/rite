
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
(29,6)-(29,10)
(29,6)-(32,53)
(30,8)-(32,53)
(30,9)-(30,51)
(30,24)-(30,32)
(30,40)-(30,48)
(31,25)-(31,33)
(31,41)-(31,49)
(32,25)-(32,33)
(32,41)-(32,49)
*)

(* type error slice
(13,3)-(13,28)
(13,9)-(13,26)
(16,2)-(32,53)
(19,14)-(19,18)
(19,14)-(19,56)
(19,19)-(19,56)
(19,20)-(19,21)
(19,28)-(19,37)
(19,35)-(19,36)
(19,45)-(19,54)
(19,52)-(19,53)
(21,21)-(21,59)
(21,22)-(21,38)
(21,23)-(21,27)
(29,6)-(29,10)
(29,6)-(32,53)
(30,8)-(32,53)
(30,9)-(30,51)
(30,10)-(30,14)
(30,19)-(30,33)
(30,20)-(30,23)
(30,24)-(30,32)
(30,24)-(30,32)
(30,24)-(30,32)
(30,25)-(30,27)
(30,30)-(30,31)
(30,35)-(30,49)
(30,36)-(30,39)
(30,40)-(30,48)
(30,40)-(30,48)
(30,40)-(30,48)
(30,41)-(30,43)
(30,46)-(30,47)
(31,20)-(31,34)
(31,21)-(31,24)
(31,25)-(31,33)
(31,25)-(31,33)
(31,25)-(31,33)
(31,26)-(31,28)
(31,31)-(31,32)
(31,36)-(31,50)
(31,37)-(31,40)
(31,41)-(31,49)
(31,41)-(31,49)
(31,41)-(31,49)
(31,42)-(31,44)
(31,47)-(31,48)
(32,20)-(32,34)
(32,21)-(32,24)
(32,25)-(32,33)
(32,25)-(32,33)
(32,25)-(32,33)
(32,26)-(32,28)
(32,31)-(32,32)
(32,36)-(32,50)
(32,37)-(32,40)
(32,41)-(32,49)
(32,41)-(32,49)
(32,41)-(32,49)
(32,42)-(32,44)
(32,47)-(32,48)
*)

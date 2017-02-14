
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sin_Avg of expr* expr* expr;;

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
  | Sin_Avg (a,b,c) ->
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
(16,3)-(32,49)
(29,7)-(29,11)
(29,7)-(32,49)
(30,11)-(30,48)
(30,11)-(32,49)
(30,26)-(30,32)
(30,42)-(30,48)
(31,27)-(31,33)
(31,43)-(31,49)
(32,27)-(32,33)
(32,43)-(32,49)
*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,26)
(16,3)-(32,49)
(19,15)-(19,19)
(19,15)-(19,54)
(19,21)-(19,22)
(19,21)-(19,54)
(19,30)-(19,37)
(19,36)-(19,37)
(19,47)-(19,54)
(19,53)-(19,54)
(21,24)-(21,28)
(21,24)-(21,37)
(21,24)-(21,57)
(29,7)-(29,11)
(29,7)-(32,49)
(30,11)-(30,15)
(30,11)-(30,48)
(30,11)-(32,49)
(30,21)-(30,24)
(30,21)-(30,32)
(30,26)-(30,28)
(30,26)-(30,32)
(30,26)-(30,32)
(30,26)-(30,32)
(30,31)-(30,32)
(30,37)-(30,40)
(30,37)-(30,48)
(30,42)-(30,44)
(30,42)-(30,48)
(30,42)-(30,48)
(30,42)-(30,48)
(30,47)-(30,48)
(31,22)-(31,25)
(31,22)-(31,33)
(31,27)-(31,29)
(31,27)-(31,33)
(31,27)-(31,33)
(31,27)-(31,33)
(31,32)-(31,33)
(31,38)-(31,41)
(31,38)-(31,49)
(31,43)-(31,45)
(31,43)-(31,49)
(31,43)-(31,49)
(31,43)-(31,49)
(31,48)-(31,49)
(32,22)-(32,25)
(32,22)-(32,33)
(32,27)-(32,29)
(32,27)-(32,33)
(32,27)-(32,33)
(32,27)-(32,33)
(32,32)-(32,33)
(32,38)-(32,41)
(32,38)-(32,49)
(32,43)-(32,45)
(32,43)-(32,49)
(32,43)-(32,49)
(32,43)-(32,49)
(32,48)-(32,49)
*)

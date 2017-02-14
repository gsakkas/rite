
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
(21,24)-(21,28)
(21,24)-(21,37)
(21,24)-(21,57)
(29,10)-(29,14)
(29,10)-(29,49)
(29,10)-(30,51)
(29,10)-(30,51)
(29,10)-(31,52)
(29,10)-(31,52)
(29,10)-(32,15)
(30,12)-(30,16)
(30,12)-(30,51)
(31,13)-(31,17)
(31,13)-(31,52)
*)

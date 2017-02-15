
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
      (eval
         ((eval (a, (sin (pi *. x)), (sin (pi *. y)))),
           (eval (b, (sin (pi *. x)), (sin (pi *. y)))),
           (eval (c, (sin (pi *. x)), (sin (pi *. y))))))
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
(29,6)-(32,57)
(29,7)-(29,11)
(30,9)-(32,56)
(30,10)-(30,54)
*)

(* type error slice
(16,2)-(33,14)
(19,14)-(19,18)
(19,14)-(19,56)
(19,19)-(19,56)
(19,20)-(19,21)
(21,21)-(21,59)
(21,22)-(21,38)
(21,23)-(21,27)
(29,6)-(32,57)
(29,7)-(29,11)
(30,9)-(32,56)
(30,10)-(30,54)
(30,11)-(30,15)
*)

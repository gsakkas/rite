
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1 / (sin (pi *. (eval (e1, x, y))))) *
         (cos (pi *. (eval (e1, x, y)))))
        * (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1 / (sin (pi *. (eval (e1, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1.0 /. (sin (pi *. (eval (e1, x, y))))) *.
         (cos (pi *. (eval (e1, x, y)))))
        *. (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1.0 /. (sin (pi *. (eval (e1, x, y))));;

*)

(* changed spans
(28,6)-(29,41)
(28,6)-(30,41)
(28,7)-(28,44)
(28,8)-(28,9)
(28,12)-(28,43)
(31,17)-(31,18)
(31,17)-(31,52)
(31,21)-(31,52)
*)

(* type error slice
(16,2)-(31,52)
(16,2)-(31,52)
(16,2)-(31,52)
(19,15)-(19,18)
(19,15)-(19,44)
(28,6)-(29,41)
(28,6)-(30,41)
(28,6)-(30,41)
(28,7)-(28,44)
(28,12)-(28,43)
(28,13)-(28,16)
(29,9)-(29,40)
(29,10)-(29,13)
(30,10)-(30,41)
(30,11)-(30,14)
(31,17)-(31,52)
(31,17)-(31,52)
(31,21)-(31,52)
(31,22)-(31,25)
*)

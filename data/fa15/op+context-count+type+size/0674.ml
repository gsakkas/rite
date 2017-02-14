
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
(28,9)-(28,10)
(28,9)-(28,40)
(28,9)-(29,37)
(28,9)-(30,38)
(28,14)-(28,40)
(31,18)-(31,19)
(31,18)-(31,49)
(31,23)-(31,49)
*)

(* type error slice
(16,3)-(31,49)
(16,3)-(31,49)
(16,3)-(31,49)
(19,16)-(19,19)
(19,16)-(19,42)
(28,9)-(28,40)
(28,9)-(29,37)
(28,9)-(30,38)
(28,9)-(30,38)
(28,14)-(28,17)
(28,14)-(28,40)
(29,11)-(29,14)
(29,11)-(29,37)
(30,12)-(30,15)
(30,12)-(30,38)
(31,18)-(31,49)
(31,18)-(31,49)
(31,23)-(31,26)
(31,23)-(31,49)
*)

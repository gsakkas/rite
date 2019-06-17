
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AveThree of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Neg e -> (-1.0) *. (eval (e, x, y))
  | AveThree (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AveThree of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Neg e -> (-1.0) *. (eval (e, x, y))
  | AveThree (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y));;

*)

(* changed spans
(23,7)-(23,66)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(23,7)-(23,46)
(23,7)-(23,66)
(23,8)-(23,25)
(23,9)-(23,13)
(23,28)-(23,45)
(23,29)-(23,33)
(23,49)-(23,66)
(23,50)-(23,54)
*)

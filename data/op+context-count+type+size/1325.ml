
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | MyExpr1 (e1,e2,e3) ->
      ((Cosine (eval (e1, x, y))) *. (Sine (eval (e2, x, y)))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> Sine ((eval (e, x, y)) *. 0.5);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | MyExpr1 (e1,e2,e3) ->
      ((cos (pi *. (eval (e1, x, y)))) *. (sin (pi *. (eval (e2, x, y))))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> sin ((pi *. (eval (e, x, y))) *. 0.5);;

*)

(* changed spans
(28,9)-(28,31)
(28,17)-(28,21)
(28,39)-(28,59)
(28,45)-(28,49)
(30,18)-(30,47)
(30,25)-(30,29)
(30,25)-(30,47)
(30,31)-(30,32)
(30,31)-(30,38)
(30,34)-(30,35)
(30,37)-(30,38)
(30,44)-(30,47)
*)

(* type error slice
(16,3)-(30,47)
(17,14)-(17,15)
(19,27)-(19,31)
(19,27)-(19,40)
(19,33)-(19,34)
(19,33)-(19,40)
(19,36)-(19,37)
(19,39)-(19,40)
(28,9)-(28,31)
(28,9)-(28,59)
(28,17)-(28,21)
(28,17)-(28,31)
(28,23)-(28,25)
(28,23)-(28,31)
(28,27)-(28,28)
(28,30)-(28,31)
(28,39)-(28,59)
(28,45)-(28,49)
(28,45)-(28,59)
(28,51)-(28,53)
(28,51)-(28,59)
(28,55)-(28,56)
(28,58)-(28,59)
(30,18)-(30,47)
(30,25)-(30,47)
*)

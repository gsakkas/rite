
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
  | MyExpr1 (e1,e2,e3) -> ((sqrt e1) *. (sqrt e2)) *. e3
  | MyExpr2 e -> e *. 0.5;;


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
      ((sqrt (eval (e1, x, y))) *. (sqrt (eval (e2, x, y)))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> (eval (e, x, y)) *. 0.5;;

*)

(* changed spans
(27,33)-(27,35)
(27,40)-(27,49)
(27,46)-(27,48)
(27,54)-(27,56)
(28,17)-(28,18)
(28,17)-(28,25)
(28,22)-(28,25)
*)

(* type error slice
(16,2)-(28,25)
(16,2)-(28,25)
(16,2)-(28,25)
(16,2)-(28,25)
(27,26)-(27,56)
(27,27)-(27,36)
(27,28)-(27,32)
(27,33)-(27,35)
(27,40)-(27,49)
(27,41)-(27,45)
(27,46)-(27,48)
(27,54)-(27,56)
(28,17)-(28,18)
(28,17)-(28,25)
*)

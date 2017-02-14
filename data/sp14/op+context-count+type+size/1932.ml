
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) *. (eval (x2, x, y)))) *.
        (e ** ((- pi) *. ((eval (x3, x, y)) ** 2.)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) *. (eval (x2, x, y)))) *.
        (e_num ** ((-. pi) *. ((eval (x3, x, y)) ** 2.)));;

*)

(* changed spans
(12,9)-(12,26)
(28,9)-(28,10)
(28,15)-(28,21)
*)

(* type error slice
(12,3)-(12,28)
(12,9)-(12,26)
(14,3)-(28,54)
(14,14)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,2)-(28,52)
(15,8)-(15,9)
(18,26)-(18,43)
(18,27)-(18,31)
(18,32)-(18,42)
(18,33)-(18,35)
(28,8)-(28,52)
(28,9)-(28,10)
(28,11)-(28,13)
(28,14)-(28,51)
(28,15)-(28,21)
(28,15)-(28,21)
(28,18)-(28,20)
*)

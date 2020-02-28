
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
(28,10)-(28,11)
e_num
VarG

(28,16)-(28,22)
(-. pi)
UopG VarG

*)

(* type error slice
(12,4)-(12,29)
(12,10)-(12,27)
(14,4)-(28,55)
(14,15)-(28,53)
(15,3)-(28,53)
(15,9)-(15,10)
(18,27)-(18,44)
(18,28)-(18,32)
(18,33)-(18,43)
(18,34)-(18,36)
(28,9)-(28,53)
(28,10)-(28,11)
(28,12)-(28,14)
(28,15)-(28,52)
(28,16)-(28,22)
(28,19)-(28,21)
*)

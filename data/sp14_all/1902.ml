
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Root of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Squared e -> (eval e) ** 2
  | Root e -> (eval e) ** (1 / 2);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Root of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Squared e -> (eval (e, x, y)) ** 2.
  | Root e -> (eval (e, x, y)) ** 0.5;;

*)

(* changed spans
(27,24)-(27,25)
(e , x , y)
TupleG (fromList [VarG])

(27,30)-(27,31)
2.0
LitG

(28,21)-(28,22)
(e , x , y)
TupleG (fromList [VarG])

(28,27)-(28,34)
0.5
LitG

*)

(* type error slice
(16,3)-(28,34)
(19,26)-(19,42)
(19,27)-(19,31)
(19,32)-(19,41)
(27,18)-(27,26)
(27,18)-(27,31)
(27,19)-(27,23)
(27,24)-(27,25)
(27,27)-(27,29)
(27,30)-(27,31)
(28,15)-(28,23)
(28,15)-(28,34)
(28,16)-(28,20)
(28,21)-(28,22)
(28,24)-(28,26)
(28,27)-(28,34)
*)

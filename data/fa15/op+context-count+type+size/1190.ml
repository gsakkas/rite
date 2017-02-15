
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | NatLog of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | Circ (circ1,circ2) -> ((eval circ1) ** 2) + ((eval circ2) ** 2)
  | NatLog nlog -> log nlog;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | NatLog of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      ((eval (circ1, x, y)) ** 2.0) +. ((eval (circ2, x, y)) ** 2.0)
  | NatLog nlog -> log (eval (nlog, x, y));;

*)

(* changed spans
(27,26)-(27,67)
(27,33)-(27,38)
(27,43)-(27,44)
(27,48)-(27,67)
(27,55)-(27,60)
(27,65)-(27,66)
(28,19)-(28,22)
(28,19)-(28,27)
(28,23)-(28,27)
*)

(* type error slice
(16,2)-(28,27)
(16,2)-(28,27)
(16,2)-(28,27)
(16,2)-(28,27)
(16,2)-(28,27)
(19,17)-(19,20)
(19,17)-(19,48)
(19,28)-(19,47)
(19,29)-(19,33)
(19,34)-(19,46)
(27,26)-(27,45)
(27,26)-(27,67)
(27,27)-(27,39)
(27,28)-(27,32)
(27,33)-(27,38)
(27,40)-(27,42)
(27,43)-(27,44)
(27,48)-(27,67)
(27,49)-(27,61)
(27,50)-(27,54)
(27,55)-(27,60)
(27,62)-(27,64)
(27,65)-(27,66)
(28,19)-(28,22)
(28,19)-(28,27)
(28,23)-(28,27)
*)

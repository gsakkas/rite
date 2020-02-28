
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
  | Circ (circ1,circ2) -> ((eval circ1) ** 2) + (eval circ2)
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
(27,27)-(27,61)
(eval (circ1 , x , y) ** 2.0) +. (eval (circ2 , x , y) ** 2.0)
BopG (AppG [EmptyG,EmptyG]) (AppG [EmptyG,EmptyG])

(28,24)-(28,28)
eval (nlog , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(16,3)-(28,28)
(19,18)-(19,21)
(19,18)-(19,49)
(19,29)-(19,48)
(19,30)-(19,34)
(19,35)-(19,47)
(27,27)-(27,46)
(27,27)-(27,61)
(27,28)-(27,40)
(27,29)-(27,33)
(27,34)-(27,39)
(27,41)-(27,43)
(27,44)-(27,45)
(27,49)-(27,61)
(27,50)-(27,54)
(27,55)-(27,60)
(28,20)-(28,23)
(28,20)-(28,28)
(28,24)-(28,28)
*)

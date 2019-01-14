
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
(27,26)-(27,60)
(eval (circ1 , x , y) ** 2.0) +. (eval (circ2 , x , y) ** 2.0)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,33)-(27,38)
(circ1 , x , y)
TupleG (fromList [VarG])

(27,43)-(27,44)
x
VarG

(27,48)-(27,60)
y
VarG

(27,48)-(27,60)
(**)
VarG

(27,48)-(27,60)
eval (circ2 , x , y) ** 2.0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(27,48)-(27,60)
2.0
LitG

(27,54)-(27,59)
(circ2 , x , y)
TupleG (fromList [VarG])

(28,19)-(28,27)
x
VarG

(28,19)-(28,27)
y
VarG

(28,19)-(28,27)
2.0
LitG

(28,23)-(28,27)
eval
VarG

(28,23)-(28,27)
eval (nlog , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,23)-(28,27)
(nlog , x , y)
TupleG (fromList [VarG])

*)

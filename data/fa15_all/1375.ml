
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
      (exp eval (circ1, x, y) 2.0) + (exp eval (circ2, x, y) 2.0)
  | NatLog nlog -> log eval (nlog, x, y);;


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
(28,7)-(28,10)
(eval (circ1 , x , y) ** 2.0) +. (eval (circ2 , x , y) ** 2.0)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(28,11)-(28,15)
(**)
VarG

(28,11)-(28,15)
eval (circ1 , x , y) ** 2.0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(28,11)-(28,15)
eval (circ1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,38)-(28,41)
eval (circ2 , x , y) ** 2.0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(28,42)-(28,46)
(**)
VarG

(28,42)-(28,46)
eval (circ2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(29,19)-(29,40)
log (eval (nlog , x , y))
AppG (fromList [AppG (fromList [EmptyG])])

(29,23)-(29,27)
eval (nlog , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

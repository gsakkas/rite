
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
      ((eval (circ1, x, y)) ** 2) + ((eval (circ2, x, y)) ** 2)
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
(28,7)-(28,64)
(eval (circ1 , x , y) ** 2.0) +. (eval (circ2 , x , y) ** 2.0)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(29,20)-(29,41)
log (eval (nlog , x , y))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(28,7)-(28,34)
(28,29)-(28,31)
(28,32)-(28,33)
(28,37)-(28,64)
(28,59)-(28,61)
(28,62)-(28,63)
(29,20)-(29,23)
(29,20)-(29,41)
*)

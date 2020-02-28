
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | GoldTimes of expr;;

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
      sqrt (((eval (circ1, x, y)) ** 2.0) +. ((eval (circ2, x, y)) ** 2.0))
  | GoldTimes m4 -> ((eval (m4, x, y)) * (1 +. (sqrt 5))) /. 2.0;;


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
  | GoldTimes of expr;;

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
      sqrt (((eval (circ1, x, y)) ** 2.0) +. ((eval (circ2, x, y)) ** 2.0))
  | GoldTimes m4 -> ((eval (m4, x, y)) *. (1.0 +. (sqrt 5.0))) /. 2.0;;

*)

(* changed spans
(29,21)-(29,58)
eval (m4 , x , y) *. (1.0 +. sqrt 5.0)
BopG (AppG [EmptyG]) (BopG EmptyG EmptyG)

*)

(* type error slice
(19,22)-(19,49)
(19,29)-(19,48)
(19,30)-(19,34)
(29,21)-(29,58)
(29,21)-(29,65)
(29,22)-(29,39)
(29,23)-(29,27)
(29,42)-(29,57)
(29,43)-(29,44)
(29,48)-(29,56)
(29,49)-(29,53)
(29,54)-(29,55)
*)

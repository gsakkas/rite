
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi * (eval (b, x, y)))
  | Cosine b -> cos (pi * (eval (b, x, y)))
  | Average (a,b) -> (eval (a, x, y)) + ((eval (b, x, y)) / 2)
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | _ -> 0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> (eval (a, x, y)) +. ((eval (b, x, y)) /. 2.0)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | _ -> 0.0;;

*)

(* changed spans
(17,19)-(17,42)
pi *. eval (b , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,44)
pi *. eval (b , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,22)-(19,63)
eval (a , x , y) +. (eval (b , x , y) /. 2.0)
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

(20,20)-(20,55)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(25,10)-(25,11)
0.0
LitG

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(17,15)-(17,18)
(17,15)-(17,42)
(17,19)-(17,42)
(17,20)-(17,22)
(18,17)-(18,20)
(18,17)-(18,44)
(18,21)-(18,44)
(18,22)-(18,24)
*)

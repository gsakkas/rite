
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(11,14)-(23,25)
atan
VarG

(11,14)-(23,25)
atan 1.0
AppG (fromList [LitG])

(11,14)-(23,25)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(11,14)-(23,25)
4.0
LitG

(11,14)-(23,25)
1.0
LitG

(16,18)-(16,41)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(17,20)-(17,43)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,58)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,22)-(18,38)
eval (a , x , y) +. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,19)-(19,35)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,19)-(19,54)
2.0
LitG

*)

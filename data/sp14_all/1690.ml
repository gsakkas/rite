
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
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;


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
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(15,19)-(15,42)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(16,21)-(16,44)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(15,15)-(15,18)
(15,15)-(15,42)
(15,19)-(15,42)
(15,20)-(15,22)
(15,25)-(15,41)
(15,26)-(15,30)
(16,17)-(16,20)
(16,17)-(16,44)
(16,21)-(16,44)
(16,22)-(16,24)
(17,22)-(17,60)
(17,23)-(17,39)
(17,24)-(17,28)
(17,43)-(17,59)
(17,44)-(17,48)
(18,20)-(18,36)
(18,20)-(18,56)
(18,21)-(18,25)
(18,40)-(18,56)
(18,41)-(18,45)
*)


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
  | Sine var1 -> sin (pi *. (eval (var1, x, y)))
  | Cosine var2 -> cos (pi *. (eval (var2, x, y)))
  | Average (var3,var4) -> ((eval (var3, x, y)) + (eval (var4, x, y))) / 2
  | Times (var5,var6) -> (eval (var5, x, y)) * (eval (var6, x, y))
  | Thresh (var7,var8,var9,var0) ->
      if (eval (var7, x, y)) < (eval (var8, x, y))
      then eval (var9, x, y)
      else eval (var0, x, y);;


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
  | Sine var1 -> sin (pi *. (eval (var1, x, y)))
  | Cosine var2 -> cos (pi *. (eval (var2, x, y)))
  | Average (var3,var4) ->
      ((eval (var3, x, y)) +. (eval (var4, x, y))) /. 2.0
  | Times (var5,var6) -> (eval (var5, x, y)) *. (eval (var6, x, y))
  | Thresh (var7,var8,var9,var0) ->
      if (eval (var7, x, y)) < (eval (var8, x, y))
      then eval (var9, x, y)
      else eval (var0, x, y);;

*)

(* changed spans
(19,28)-(19,75)
(eval (var3 , x , y) +. eval (var4 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,26)-(20,67)
eval (var5 , x , y) *. eval (var6 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(17,22)-(17,49)
(17,29)-(17,48)
(17,30)-(17,34)
(19,28)-(19,71)
(19,29)-(19,48)
(19,30)-(19,34)
(19,51)-(19,70)
(19,52)-(19,56)
(20,26)-(20,45)
(20,26)-(20,67)
(20,27)-(20,31)
(20,48)-(20,67)
(20,49)-(20,53)
*)

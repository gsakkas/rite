
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
(19,30)-(19,46)
(19,30)-(19,68)
(19,30)-(19,75)
(19,74)-(19,75)
(20,27)-(20,43)
(20,27)-(20,65)
*)

(* type error slice
(14,3)-(24,28)
(15,14)-(15,15)
(17,30)-(17,34)
(17,30)-(17,46)
(17,36)-(17,40)
(17,36)-(17,46)
(17,42)-(17,43)
(17,45)-(17,46)
(19,30)-(19,34)
(19,30)-(19,46)
(19,30)-(19,68)
(19,30)-(19,75)
(19,36)-(19,40)
(19,36)-(19,46)
(19,42)-(19,43)
(19,45)-(19,46)
(19,52)-(19,56)
(19,52)-(19,68)
(19,58)-(19,62)
(19,58)-(19,68)
(19,64)-(19,65)
(19,67)-(19,68)
(20,27)-(20,31)
(20,27)-(20,43)
(20,27)-(20,65)
(20,33)-(20,37)
(20,33)-(20,43)
(20,39)-(20,40)
(20,42)-(20,43)
(20,49)-(20,53)
(20,49)-(20,65)
(20,55)-(20,59)
(20,55)-(20,65)
(20,61)-(20,62)
(20,64)-(20,65)
*)

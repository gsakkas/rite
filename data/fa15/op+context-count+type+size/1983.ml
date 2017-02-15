
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if
        (((-1.0) < x) < 1.0) && ((x > (-1.0)) && ((y < 1.0) && (y > (-1.0))))
      then x *. y
      else (eval (a, x, y)) ** (eval (b, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(27,6)-(30,47)
(28,8)-(28,28)
(28,8)-(28,77)
(28,9)-(28,21)
(28,10)-(28,16)
(28,12)-(28,15)
(28,19)-(28,20)
(28,24)-(28,27)
(28,32)-(28,77)
(28,33)-(28,45)
(28,34)-(28,35)
(28,38)-(28,44)
(28,40)-(28,43)
(28,49)-(28,76)
(29,11)-(29,17)
(30,11)-(30,47)
*)

(* type error slice
(14,3)-(30,49)
(14,14)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(15,2)-(30,47)
(16,13)-(16,14)
(17,13)-(17,14)
(18,14)-(18,17)
(18,14)-(18,42)
(18,18)-(18,42)
(18,25)-(18,41)
(18,26)-(18,30)
(19,16)-(19,19)
(19,16)-(19,44)
(20,23)-(20,70)
(21,21)-(21,59)
(23,6)-(25,25)
(24,11)-(24,15)
(24,11)-(24,25)
(27,6)-(30,47)
(28,8)-(28,28)
(28,8)-(28,28)
(28,9)-(28,21)
(28,9)-(28,21)
(28,9)-(28,21)
(28,10)-(28,16)
(28,10)-(28,16)
(28,12)-(28,15)
(28,19)-(28,20)
(28,24)-(28,27)
(28,38)-(28,44)
(28,40)-(28,43)
(28,50)-(28,59)
(28,50)-(28,59)
(28,51)-(28,52)
(28,55)-(28,58)
(28,63)-(28,75)
(28,63)-(28,75)
(28,64)-(28,65)
(28,68)-(28,74)
(28,68)-(28,74)
(28,70)-(28,73)
(29,11)-(29,12)
(29,11)-(29,17)
(29,11)-(29,17)
*)


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
(27,7)-(30,46)
(28,12)-(28,16)
(28,12)-(28,21)
(28,12)-(28,28)
(28,12)-(28,74)
(28,13)-(28,16)
(28,20)-(28,21)
(28,25)-(28,28)
(28,35)-(28,36)
(28,35)-(28,44)
(28,35)-(28,74)
(28,40)-(28,44)
(28,41)-(28,44)
(28,52)-(28,74)
(29,12)-(29,18)
(30,13)-(30,46)
*)

(* type error slice
(14,4)-(30,50)
(14,15)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(15,3)-(30,46)
(16,14)-(16,15)
(17,14)-(17,15)
(18,15)-(18,18)
(18,15)-(18,40)
(18,20)-(18,40)
(18,27)-(18,31)
(18,27)-(18,40)
(19,17)-(19,20)
(19,17)-(19,42)
(20,26)-(20,71)
(21,23)-(21,58)
(23,7)-(25,25)
(24,12)-(24,16)
(24,12)-(24,25)
(27,7)-(30,46)
(28,12)-(28,16)
(28,12)-(28,16)
(28,12)-(28,21)
(28,12)-(28,21)
(28,12)-(28,21)
(28,12)-(28,28)
(28,12)-(28,28)
(28,13)-(28,16)
(28,20)-(28,21)
(28,25)-(28,28)
(28,40)-(28,44)
(28,41)-(28,44)
(28,52)-(28,53)
(28,52)-(28,59)
(28,52)-(28,59)
(28,56)-(28,59)
(28,65)-(28,66)
(28,65)-(28,74)
(28,65)-(28,74)
(28,70)-(28,74)
(28,70)-(28,74)
(28,71)-(28,74)
(29,12)-(29,13)
(29,12)-(29,18)
(29,12)-(29,18)
*)

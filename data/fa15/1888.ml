
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | TowerInv of expr* expr* expr;;

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
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else (eval (a, x, y)) ** (eval (b, x, y))
  | TowerInv (a,b,c) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else 1 /. ((eval (a, x, y)) ** ((eval (b, x, y)) ** (eval (c, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | TowerInv of expr* expr* expr;;

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
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else (eval (a, x, y)) ** (eval (b, x, y))
  | TowerInv (a,b,c) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else
        1.0 /. ((eval (a, x, y)) ** ((eval (b, x, y)) ** (eval (c, x, y))));;

*)

(* changed spans
(34,11)-(34,12)
*)

(* type error slice
(28,10)-(28,19)
(28,11)-(28,12)
(28,15)-(28,18)
(28,23)-(28,35)
(28,24)-(28,25)
(28,28)-(28,34)
(28,30)-(28,33)
(28,41)-(28,50)
(28,42)-(28,43)
(28,46)-(28,49)
(28,54)-(28,66)
(28,55)-(28,56)
(28,59)-(28,65)
(28,61)-(28,64)
(32,23)-(32,35)
(32,24)-(32,25)
(32,28)-(32,34)
(32,30)-(32,33)
(32,54)-(32,66)
(32,55)-(32,56)
(32,59)-(32,65)
(32,61)-(32,64)
(34,11)-(34,12)
(34,11)-(34,76)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(34,76)
(16,2)-(34,76)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,42)
(19,14)-(19,17)
(19,18)-(19,42)
(19,19)-(19,21)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(19,32)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(20,16)-(20,44)
(20,16)-(20,19)
(20,20)-(20,44)
(20,21)-(20,23)
(20,27)-(20,43)
(20,28)-(20,32)
(20,33)-(20,42)
(20,34)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,23)-(21,70)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,70)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,25)
(24,9)-(24,44)
(24,9)-(24,25)
(24,10)-(24,14)
(24,15)-(24,24)
(24,16)-(24,17)
(24,19)-(24,20)
(24,22)-(24,23)
(24,28)-(24,44)
(24,29)-(24,33)
(24,34)-(24,43)
(24,35)-(24,36)
(24,38)-(24,39)
(24,41)-(24,42)
(25,11)-(25,25)
(25,11)-(25,15)
(25,16)-(25,25)
(25,17)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(26,11)-(26,25)
(26,11)-(26,15)
(26,16)-(26,25)
(26,17)-(26,18)
(26,20)-(26,21)
(26,23)-(26,24)
(28,6)-(30,47)
(28,9)-(28,67)
(28,9)-(28,36)
(28,10)-(28,19)
(28,11)-(28,12)
(28,15)-(28,18)
(28,23)-(28,35)
(28,24)-(28,25)
(28,28)-(28,34)
(28,30)-(28,33)
(28,40)-(28,67)
(28,41)-(28,50)
(28,42)-(28,43)
(28,46)-(28,49)
(28,54)-(28,66)
(28,55)-(28,56)
(28,59)-(28,65)
(28,61)-(28,64)
(29,11)-(29,14)
(30,11)-(30,47)
(30,28)-(30,30)
(30,11)-(30,27)
(30,12)-(30,16)
(30,17)-(30,26)
(30,18)-(30,19)
(30,21)-(30,22)
(30,24)-(30,25)
(30,31)-(30,47)
(30,32)-(30,36)
(30,37)-(30,46)
(30,38)-(30,39)
(30,41)-(30,42)
(30,44)-(30,45)
(32,6)-(34,76)
(32,9)-(32,67)
(32,9)-(32,36)
(32,10)-(32,19)
(32,11)-(32,12)
(32,15)-(32,18)
(32,23)-(32,35)
(32,24)-(32,25)
(32,28)-(32,34)
(32,30)-(32,33)
(32,40)-(32,67)
(32,41)-(32,50)
(32,42)-(32,43)
(32,46)-(32,49)
(32,54)-(32,66)
(32,55)-(32,56)
(32,59)-(32,65)
(32,61)-(32,64)
(33,11)-(33,14)
(34,11)-(34,76)
(34,11)-(34,12)
(34,16)-(34,76)
(34,34)-(34,36)
(34,17)-(34,33)
(34,18)-(34,22)
(34,23)-(34,32)
(34,24)-(34,25)
(34,27)-(34,28)
(34,30)-(34,31)
(34,37)-(34,75)
(34,55)-(34,57)
(34,38)-(34,54)
(34,39)-(34,43)
(34,44)-(34,53)
(34,45)-(34,46)
(34,48)-(34,49)
(34,51)-(34,52)
(34,58)-(34,74)
(34,59)-(34,63)
(34,64)-(34,73)
(34,65)-(34,66)
(34,68)-(34,69)
(34,71)-(34,72)
*)

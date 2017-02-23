
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((sin (pi * (eval (r, x, y)))) + (tan (pi * (eval (s, x, y))))) *
        (sin (pi * (eval (t, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((sin (pi *. (eval (r, x, y)))) +. (tan (pi *. (eval (s, x, y))))) *.
        (sin (pi *. (eval (t, x, y))));;

*)

(* changed spans
(27,6)-(27,69)
(27,6)-(28,37)
(27,7)-(27,36)
(27,12)-(27,35)
(27,44)-(27,67)
(28,13)-(28,36)
*)

(* type error slice
(12,3)-(12,28)
(12,9)-(12,26)
(18,18)-(18,42)
(18,25)-(18,41)
(18,26)-(18,30)
(27,7)-(27,36)
(27,8)-(27,11)
(27,12)-(27,35)
(27,12)-(27,35)
(27,12)-(27,35)
(27,13)-(27,15)
(27,18)-(27,34)
(27,19)-(27,23)
(27,39)-(27,68)
(27,40)-(27,43)
(27,44)-(27,67)
(27,44)-(27,67)
(27,50)-(27,66)
(27,51)-(27,55)
(28,8)-(28,37)
(28,9)-(28,12)
(28,13)-(28,36)
(28,13)-(28,36)
(28,19)-(28,35)
(28,20)-(28,24)
*)

(* all spans
(12,9)-(12,26)
(12,9)-(12,12)
(12,16)-(12,26)
(12,17)-(12,21)
(12,22)-(12,25)
(14,14)-(28,37)
(15,2)-(28,37)
(15,8)-(15,9)
(16,13)-(16,14)
(17,13)-(17,14)
(18,14)-(18,42)
(18,14)-(18,17)
(18,18)-(18,42)
(18,19)-(18,21)
(18,25)-(18,41)
(18,26)-(18,30)
(18,31)-(18,40)
(18,32)-(18,33)
(18,35)-(18,36)
(18,38)-(18,39)
(19,16)-(19,44)
(19,16)-(19,19)
(19,20)-(19,44)
(19,21)-(19,23)
(19,27)-(19,43)
(19,28)-(19,32)
(19,33)-(19,42)
(19,34)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(20,21)-(20,66)
(20,21)-(20,59)
(20,22)-(20,38)
(20,23)-(20,27)
(20,28)-(20,37)
(20,29)-(20,30)
(20,32)-(20,33)
(20,35)-(20,36)
(20,42)-(20,58)
(20,43)-(20,47)
(20,48)-(20,57)
(20,49)-(20,50)
(20,52)-(20,53)
(20,55)-(20,56)
(20,63)-(20,66)
(21,19)-(21,55)
(21,19)-(21,35)
(21,20)-(21,24)
(21,25)-(21,34)
(21,26)-(21,27)
(21,29)-(21,30)
(21,32)-(21,33)
(21,39)-(21,55)
(21,40)-(21,44)
(21,45)-(21,54)
(21,46)-(21,47)
(21,49)-(21,50)
(21,52)-(21,53)
(23,6)-(25,25)
(23,9)-(23,44)
(23,9)-(23,25)
(23,10)-(23,14)
(23,15)-(23,24)
(23,16)-(23,17)
(23,19)-(23,20)
(23,22)-(23,23)
(23,28)-(23,44)
(23,29)-(23,33)
(23,34)-(23,43)
(23,35)-(23,36)
(23,38)-(23,39)
(23,41)-(23,42)
(24,11)-(24,25)
(24,11)-(24,15)
(24,16)-(24,25)
(24,17)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(25,11)-(25,25)
(25,11)-(25,15)
(25,16)-(25,25)
(25,17)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(27,6)-(28,37)
(27,6)-(27,69)
(27,7)-(27,36)
(27,8)-(27,11)
(27,12)-(27,35)
(27,13)-(27,15)
(27,18)-(27,34)
(27,19)-(27,23)
(27,24)-(27,33)
(27,25)-(27,26)
(27,28)-(27,29)
(27,31)-(27,32)
(27,39)-(27,68)
(27,40)-(27,43)
(27,44)-(27,67)
(27,45)-(27,47)
(27,50)-(27,66)
(27,51)-(27,55)
(27,56)-(27,65)
(27,57)-(27,58)
(27,60)-(27,61)
(27,63)-(27,64)
(28,8)-(28,37)
(28,9)-(28,12)
(28,13)-(28,36)
(28,14)-(28,16)
(28,19)-(28,35)
(28,20)-(28,24)
(28,25)-(28,34)
(28,26)-(28,27)
(28,29)-(28,30)
(28,32)-(28,33)
*)

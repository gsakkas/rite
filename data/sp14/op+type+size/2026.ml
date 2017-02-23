
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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) -> if (eval s) < (eval t) then eval u else eval v;;


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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y);;

*)

(* changed spans
(21,33)-(21,34)
(21,38)-(21,46)
(21,44)-(21,45)
(21,52)-(21,56)
(21,52)-(21,58)
(21,57)-(21,58)
(21,64)-(21,68)
(21,69)-(21,70)
*)

(* type error slice
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(14,2)-(21,70)
(17,20)-(17,36)
(17,21)-(17,25)
(17,26)-(17,35)
(21,27)-(21,35)
(21,28)-(21,32)
(21,33)-(21,34)
(21,38)-(21,46)
(21,39)-(21,43)
(21,44)-(21,45)
(21,52)-(21,56)
(21,52)-(21,58)
(21,57)-(21,58)
(21,64)-(21,68)
(21,64)-(21,70)
(21,69)-(21,70)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(21,70)
(14,2)-(21,70)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,36)
(17,14)-(17,16)
(17,20)-(17,36)
(17,21)-(17,25)
(17,26)-(17,35)
(17,27)-(17,28)
(17,30)-(17,31)
(17,33)-(17,34)
(18,16)-(18,44)
(18,16)-(18,19)
(18,20)-(18,44)
(18,21)-(18,23)
(18,27)-(18,43)
(18,28)-(18,32)
(18,33)-(18,42)
(18,34)-(18,35)
(18,37)-(18,38)
(18,40)-(18,41)
(19,21)-(19,66)
(19,21)-(19,59)
(19,22)-(19,38)
(19,23)-(19,27)
(19,28)-(19,37)
(19,29)-(19,30)
(19,32)-(19,33)
(19,35)-(19,36)
(19,42)-(19,58)
(19,43)-(19,47)
(19,48)-(19,57)
(19,49)-(19,50)
(19,52)-(19,53)
(19,55)-(19,56)
(19,63)-(19,66)
(20,19)-(20,55)
(20,19)-(20,35)
(20,20)-(20,24)
(20,25)-(20,34)
(20,26)-(20,27)
(20,29)-(20,30)
(20,32)-(20,33)
(20,39)-(20,55)
(20,40)-(20,44)
(20,45)-(20,54)
(20,46)-(20,47)
(20,49)-(20,50)
(20,52)-(20,53)
(21,24)-(21,70)
(21,27)-(21,46)
(21,27)-(21,35)
(21,28)-(21,32)
(21,33)-(21,34)
(21,38)-(21,46)
(21,39)-(21,43)
(21,44)-(21,45)
(21,52)-(21,58)
(21,52)-(21,56)
(21,57)-(21,58)
(21,64)-(21,70)
(21,64)-(21,68)
(21,69)-(21,70)
*)

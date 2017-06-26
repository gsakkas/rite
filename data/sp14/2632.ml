
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
  | Sine e' -> sin (pi *. (eval e' x y))
  | Cosine e' -> cos (pi *. (eval e' x y))
  | Average (e1,e2) -> ((eval e1 x y) +. (eval e2 x y)) /. 2
  | Times (e1,e2) -> (eval e1 x y) *. (eval e2 x y)
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a x y)) < (eval (b x y))
      then eval (a_less x y)
      else eval (b_less x y);;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(17,26)-(17,39)
(17,32)-(17,34)
(18,28)-(18,41)
(18,34)-(18,36)
(19,24)-(19,37)
(19,30)-(19,32)
(19,41)-(19,54)
(19,47)-(19,49)
(19,59)-(19,60)
(20,21)-(20,34)
(20,27)-(20,29)
(20,38)-(20,51)
(20,44)-(20,46)
(22,15)-(22,22)
(22,32)-(22,39)
(23,16)-(23,28)
(24,16)-(24,28)
*)

(* type error slice
(13,3)-(24,30)
(13,14)-(24,28)
(14,2)-(24,28)
(17,15)-(17,18)
(17,15)-(17,40)
(17,26)-(17,39)
(17,27)-(17,31)
(17,32)-(17,34)
(19,23)-(19,60)
(19,59)-(19,60)
(20,38)-(20,51)
(20,39)-(20,43)
(22,6)-(24,28)
(22,15)-(22,22)
(22,16)-(22,17)
(22,32)-(22,39)
(22,33)-(22,34)
(23,16)-(23,28)
(23,17)-(23,23)
(24,11)-(24,15)
(24,11)-(24,28)
(24,16)-(24,28)
(24,17)-(24,23)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(24,28)
(14,2)-(24,28)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,15)-(17,40)
(17,15)-(17,18)
(17,19)-(17,40)
(17,20)-(17,22)
(17,26)-(17,39)
(17,27)-(17,31)
(17,32)-(17,34)
(17,35)-(17,36)
(17,37)-(17,38)
(18,17)-(18,42)
(18,17)-(18,20)
(18,21)-(18,42)
(18,22)-(18,24)
(18,28)-(18,41)
(18,29)-(18,33)
(18,34)-(18,36)
(18,37)-(18,38)
(18,39)-(18,40)
(19,23)-(19,60)
(19,23)-(19,55)
(19,24)-(19,37)
(19,25)-(19,29)
(19,30)-(19,32)
(19,33)-(19,34)
(19,35)-(19,36)
(19,41)-(19,54)
(19,42)-(19,46)
(19,47)-(19,49)
(19,50)-(19,51)
(19,52)-(19,53)
(19,59)-(19,60)
(20,21)-(20,51)
(20,21)-(20,34)
(20,22)-(20,26)
(20,27)-(20,29)
(20,30)-(20,31)
(20,32)-(20,33)
(20,38)-(20,51)
(20,39)-(20,43)
(20,44)-(20,46)
(20,47)-(20,48)
(20,49)-(20,50)
(22,6)-(24,28)
(22,9)-(22,40)
(22,9)-(22,23)
(22,10)-(22,14)
(22,15)-(22,22)
(22,16)-(22,17)
(22,18)-(22,19)
(22,20)-(22,21)
(22,26)-(22,40)
(22,27)-(22,31)
(22,32)-(22,39)
(22,33)-(22,34)
(22,35)-(22,36)
(22,37)-(22,38)
(23,11)-(23,28)
(23,11)-(23,15)
(23,16)-(23,28)
(23,17)-(23,23)
(23,24)-(23,25)
(23,26)-(23,27)
(24,11)-(24,28)
(24,11)-(24,15)
(24,16)-(24,28)
(24,17)-(24,23)
(24,24)-(24,25)
(24,26)-(24,27)
*)

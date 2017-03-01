
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) /. 2) + ((eval (e2, x, y)) /. 2)
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) /. 2.0) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,23)-(17,74)
(17,45)-(17,46)
(17,72)-(17,73)
(18,21)-(18,38)
(18,21)-(18,58)
*)

(* type error slice
(15,14)-(15,17)
(15,14)-(15,34)
(15,18)-(15,34)
(15,19)-(15,23)
(17,23)-(17,47)
(17,23)-(17,47)
(17,23)-(17,74)
(17,23)-(17,74)
(17,45)-(17,46)
(17,50)-(17,74)
(17,50)-(17,74)
(17,72)-(17,73)
(18,21)-(18,38)
(18,21)-(18,58)
(18,21)-(18,58)
(18,22)-(18,26)
(18,41)-(18,58)
(18,42)-(18,46)
*)

(* all spans
(11,14)-(22,26)
(12,2)-(22,26)
(12,8)-(12,9)
(13,13)-(13,14)
(14,13)-(14,14)
(15,14)-(15,34)
(15,14)-(15,17)
(15,18)-(15,34)
(15,19)-(15,23)
(15,24)-(15,33)
(15,25)-(15,26)
(15,28)-(15,29)
(15,31)-(15,32)
(16,16)-(16,36)
(16,16)-(16,19)
(16,20)-(16,36)
(16,21)-(16,25)
(16,26)-(16,35)
(16,27)-(16,28)
(16,30)-(16,31)
(16,33)-(16,34)
(17,23)-(17,74)
(17,23)-(17,47)
(17,24)-(17,41)
(17,25)-(17,29)
(17,30)-(17,40)
(17,31)-(17,33)
(17,35)-(17,36)
(17,38)-(17,39)
(17,45)-(17,46)
(17,50)-(17,74)
(17,51)-(17,68)
(17,52)-(17,56)
(17,57)-(17,67)
(17,58)-(17,60)
(17,62)-(17,63)
(17,65)-(17,66)
(17,72)-(17,73)
(18,21)-(18,58)
(18,21)-(18,38)
(18,22)-(18,26)
(18,27)-(18,37)
(18,28)-(18,30)
(18,32)-(18,33)
(18,35)-(18,36)
(18,41)-(18,58)
(18,42)-(18,46)
(18,47)-(18,57)
(18,48)-(18,50)
(18,52)-(18,53)
(18,55)-(18,56)
(20,6)-(22,26)
(20,9)-(20,46)
(20,9)-(20,26)
(20,10)-(20,14)
(20,15)-(20,25)
(20,16)-(20,18)
(20,20)-(20,21)
(20,23)-(20,24)
(20,29)-(20,46)
(20,30)-(20,34)
(20,35)-(20,45)
(20,36)-(20,38)
(20,40)-(20,41)
(20,43)-(20,44)
(21,11)-(21,26)
(21,11)-(21,15)
(21,16)-(21,26)
(21,17)-(21,19)
(21,21)-(21,22)
(21,24)-(21,25)
(22,11)-(22,26)
(22,11)-(22,15)
(22,16)-(22,26)
(22,17)-(22,19)
(22,21)-(22,22)
(22,24)-(22,25)
*)

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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> (eval (c, x, y)) +. ((eval (d, x, y)) /. 2)
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> (eval (c, x, y)) +. ((eval (d, x, y)) /. 2.0)
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y);;

*)

(* changed spans
(19,62)-(19,63)
*)

(* type error slice
(19,41)-(19,64)
(19,62)-(19,63)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(24,25)
(14,2)-(24,25)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,42)
(17,14)-(17,17)
(17,18)-(17,42)
(17,19)-(17,21)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(17,32)-(17,33)
(17,35)-(17,36)
(17,38)-(17,39)
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
(19,21)-(19,64)
(19,21)-(19,37)
(19,22)-(19,26)
(19,27)-(19,36)
(19,28)-(19,29)
(19,31)-(19,32)
(19,34)-(19,35)
(19,41)-(19,64)
(19,42)-(19,58)
(19,43)-(19,47)
(19,48)-(19,57)
(19,49)-(19,50)
(19,52)-(19,53)
(19,55)-(19,56)
(19,62)-(19,63)
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
(22,6)-(24,25)
(22,9)-(22,44)
(22,9)-(22,25)
(22,10)-(22,14)
(22,15)-(22,24)
(22,16)-(22,17)
(22,19)-(22,20)
(22,22)-(22,23)
(22,28)-(22,44)
(22,29)-(22,33)
(22,34)-(22,43)
(22,35)-(22,36)
(22,38)-(22,39)
(22,41)-(22,42)
(23,11)-(23,25)
(23,11)-(23,15)
(23,16)-(23,25)
(23,17)-(23,18)
(23,20)-(23,21)
(23,23)-(23,24)
(24,11)-(24,25)
(24,11)-(24,15)
(24,16)-(24,25)
(24,17)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
*)

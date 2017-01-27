
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
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;


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
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(15,20)-(15,39)
(16,22)-(16,41)
(18,21)-(18,34)
(18,41)-(18,54)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(24,17)
(13,15)-(24,15)
(14,3)-(24,15)
(14,9)-(14,10)
(15,15)-(15,18)
(15,15)-(15,39)
(15,20)-(15,22)
(15,20)-(15,39)
(15,26)-(15,30)
(15,26)-(15,39)
(15,32)-(15,33)
(15,32)-(15,39)
(15,35)-(15,36)
(15,38)-(15,39)
(16,17)-(16,20)
(16,17)-(16,41)
(16,22)-(16,24)
(16,22)-(16,41)
(17,24)-(17,28)
(17,24)-(17,37)
(17,24)-(17,57)
(17,30)-(17,31)
(17,30)-(17,37)
(17,33)-(17,34)
(17,36)-(17,37)
(17,44)-(17,48)
(17,44)-(17,57)
(17,50)-(17,51)
(17,50)-(17,57)
(17,53)-(17,54)
(17,56)-(17,57)
(18,21)-(18,25)
(18,21)-(18,34)
(18,21)-(18,54)
(18,27)-(18,28)
(18,27)-(18,34)
(18,30)-(18,31)
(18,33)-(18,34)
(18,41)-(18,45)
(18,41)-(18,54)
(18,47)-(18,48)
(18,47)-(18,54)
(18,50)-(18,51)
(18,53)-(18,54)
(20,7)-(22,25)
(21,12)-(21,16)
(21,12)-(21,25)
(21,18)-(21,19)
(21,18)-(21,25)
(21,21)-(21,22)
(21,24)-(21,25)
(23,14)-(23,15)
(24,14)-(24,15)
*)

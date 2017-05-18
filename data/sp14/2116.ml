
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let c1 () = failwith "to be implemented";;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Cosine c1 -> cos (eval (c1, x, y))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let c1 () = (10, 13, 57);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (pi *. (eval (s1, x, y)))
  | Cosine c1 -> cos (pi *. (eval (c1, x, y)))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (h1,h2,h3,h4) ->
      if (eval (h1, x, y)) < (eval (h2, x, y))
      then eval (h3, x, y)
      else eval (h4, x, y);;

*)

(* changed spans
(11,12)-(11,20)
(11,12)-(11,40)
(11,21)-(11,40)
(13,14)-(19,68)
(14,2)-(19,68)
(17,19)-(17,36)
(18,21)-(18,38)
(19,67)-(19,68)
*)

(* type error slice
(19,23)-(19,68)
(19,67)-(19,68)
*)

(* all spans
(11,7)-(11,40)
(11,12)-(11,40)
(11,12)-(11,20)
(11,21)-(11,40)
(13,14)-(19,68)
(14,2)-(19,68)
(14,8)-(14,9)
(15,13)-(15,21)
(15,13)-(15,14)
(15,18)-(15,21)
(16,13)-(16,21)
(16,13)-(16,14)
(16,18)-(16,21)
(17,15)-(17,36)
(17,15)-(17,18)
(17,19)-(17,36)
(17,20)-(17,24)
(17,25)-(17,35)
(17,26)-(17,28)
(17,30)-(17,31)
(17,33)-(17,34)
(18,17)-(18,38)
(18,17)-(18,20)
(18,21)-(18,38)
(18,22)-(18,26)
(18,27)-(18,37)
(18,28)-(18,30)
(18,32)-(18,33)
(18,35)-(18,36)
(19,23)-(19,68)
(19,23)-(19,63)
(19,24)-(19,41)
(19,25)-(19,29)
(19,30)-(19,40)
(19,31)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(19,45)-(19,62)
(19,46)-(19,50)
(19,51)-(19,61)
(19,52)-(19,54)
(19,56)-(19,57)
(19,59)-(19,60)
(19,67)-(19,68)
*)

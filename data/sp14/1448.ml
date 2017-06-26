
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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> ((eval (a, x, y)), (eval (b, x, y))) / 2;;


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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(17,21)-(17,57)
(17,21)-(17,61)
(17,60)-(17,61)
*)

(* type error slice
(12,2)-(17,61)
(15,14)-(15,17)
(15,14)-(15,34)
(17,21)-(17,57)
(17,21)-(17,61)
*)

(* all spans
(11,14)-(17,61)
(12,2)-(17,61)
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
(17,21)-(17,61)
(17,21)-(17,57)
(17,22)-(17,38)
(17,23)-(17,27)
(17,28)-(17,37)
(17,29)-(17,30)
(17,32)-(17,33)
(17,35)-(17,36)
(17,40)-(17,56)
(17,41)-(17,45)
(17,46)-(17,55)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,54)
(17,60)-(17,61)
*)

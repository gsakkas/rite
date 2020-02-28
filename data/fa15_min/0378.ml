
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec eval (e,x,y) = buildTimes (buildX, buildY);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x | VarY  -> y;;

*)

(* changed spans
(17,24)-(17,51)
match e with
| VarX -> x
| VarY -> y
CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG)]

*)

(* type error slice
(11,4)-(11,42)
(11,17)-(11,40)
(11,26)-(11,40)
(11,37)-(11,39)
(15,4)-(15,23)
(15,12)-(15,21)
(17,24)-(17,34)
(17,24)-(17,51)
(17,35)-(17,51)
(17,44)-(17,50)
*)

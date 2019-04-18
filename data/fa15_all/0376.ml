
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

let rec eval (e,x,y) = buildTimes buildX buildY;;


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
(17,24)-(17,48)
match e with
| VarX -> x
| VarY -> y
CaseG (fromList [(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(11,4)-(11,42)
(11,17)-(11,40)
(13,4)-(13,23)
(13,12)-(13,21)
(17,24)-(17,34)
(17,24)-(17,48)
(17,35)-(17,41)
*)

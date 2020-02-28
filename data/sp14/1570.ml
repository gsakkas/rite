
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec eval (e,x,y) =
  match e with | VarX  -> buildX * 1.0 | VarY  -> buildY * 1.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x;;

*)

(* changed spans
(16,3)-(16,63)
match e with
| VarX -> x
CaseG VarG [(ConPatG Nothing,Nothing,VarG)]

(16,27)-(16,39)
x
VarG

*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(16,27)-(16,33)
(16,27)-(16,39)
(16,36)-(16,39)
(16,51)-(16,57)
(16,51)-(16,63)
(16,60)-(16,63)
*)

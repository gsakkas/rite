
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
  match e with | VarX  -> buildX | VarY  -> buildY | Sine e -> 0.34 * e;;


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
(16,3)-(16,72)
match e with
| VarX -> x
CaseG VarG [(ConPatG Nothing,Nothing,VarG)]

(16,27)-(16,33)
x
VarG

*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(16,3)-(16,72)
(16,27)-(16,33)
(16,64)-(16,68)
(16,64)-(16,72)
(16,71)-(16,72)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) = failwith "to be implemented";;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> buildX | VarY  -> buildY | Sine e -> build (pi * e);;


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
(20,3)-(20,78)
match e with
| VarX -> x
CaseG (fromList [(ConPatG Nothing,Nothing,VarG)])

(20,27)-(20,33)
x
VarG

*)

(* type error slice
(11,4)-(11,60)
(11,16)-(11,58)
(17,4)-(17,29)
(17,10)-(17,27)
(20,3)-(20,78)
(20,64)-(20,69)
(20,64)-(20,78)
(20,70)-(20,78)
(20,71)-(20,73)
(20,76)-(20,77)
*)

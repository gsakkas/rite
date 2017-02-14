
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
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(16,2)-(16,71)
(16,2)-(16,71)
(16,2)-(16,71)
(16,26)-(16,32)
(16,63)-(16,67)
(16,63)-(16,71)
(16,63)-(16,71)
(16,63)-(16,71)
(16,70)-(16,71)
*)

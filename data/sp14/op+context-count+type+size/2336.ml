
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let rec eval (e,x,y) = match e with | VarX  -> (buildX ()) * 1.0;;


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
(11,12)-(11,21)
(11,17)-(11,21)
(13,49)-(13,65)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(13,49)-(13,55)
(13,49)-(13,58)
(13,49)-(13,65)
(13,49)-(13,65)
(13,62)-(13,65)
*)

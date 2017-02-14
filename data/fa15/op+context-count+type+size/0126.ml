
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) = buildTimes x y;;


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
(11,16)-(11,39)
(11,25)-(11,39)
(11,32)-(11,34)
(11,36)-(11,38)
(13,23)-(13,37)
*)

(* type error slice
(11,3)-(11,41)
(11,16)-(11,39)
(11,25)-(11,39)
(13,23)-(13,33)
(13,23)-(13,37)
*)


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
(11,16)-(11,39)
(11,25)-(11,39)
(11,32)-(11,34)
(11,36)-(11,38)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
*)

(* type error slice
(11,3)-(11,41)
(11,16)-(11,39)
(11,25)-(11,39)
(11,36)-(11,38)
(15,3)-(15,22)
(15,11)-(15,20)
(17,23)-(17,33)
(17,23)-(17,50)
(17,34)-(17,50)
(17,43)-(17,49)
*)

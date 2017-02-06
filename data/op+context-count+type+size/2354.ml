
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
(11,16)-(11,58)
(11,30)-(11,38)
(11,30)-(11,58)
(11,39)-(11,58)
(13,12)-(13,21)
(15,12)-(15,21)
(17,10)-(17,26)
*)

(* type error slice
(11,4)-(11,60)
(11,16)-(11,58)
(11,30)-(11,38)
(11,30)-(11,58)
(13,4)-(13,23)
(13,12)-(13,21)
(13,12)-(13,21)
(13,17)-(13,21)
(15,4)-(15,23)
(15,12)-(15,21)
(15,12)-(15,21)
(15,17)-(15,21)
(17,4)-(17,29)
(17,10)-(17,13)
(17,10)-(17,26)
(17,18)-(17,22)
(17,18)-(17,26)
(17,23)-(17,26)
(19,4)-(20,80)
(19,15)-(20,77)
(20,3)-(20,77)
(20,3)-(20,77)
(20,3)-(20,77)
(20,3)-(20,77)
(20,3)-(20,77)
(20,3)-(20,77)
(20,3)-(20,77)
(20,9)-(20,10)
(20,27)-(20,33)
(20,45)-(20,51)
(20,64)-(20,69)
(20,64)-(20,77)
(20,64)-(20,77)
(20,71)-(20,73)
(20,71)-(20,77)
(20,71)-(20,77)
(20,71)-(20,77)
(20,76)-(20,77)
*)

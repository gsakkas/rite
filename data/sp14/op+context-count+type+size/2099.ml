
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
(11,15)-(11,57)
(11,29)-(11,37)
(11,29)-(11,57)
(11,38)-(11,57)
(13,11)-(13,20)
(15,11)-(15,20)
(17,9)-(17,26)
*)

(* type error slice
(11,3)-(11,59)
(11,15)-(11,57)
(17,3)-(17,28)
(17,9)-(17,26)
(20,2)-(20,77)
(20,63)-(20,68)
(20,63)-(20,77)
(20,69)-(20,77)
(20,69)-(20,77)
(20,69)-(20,77)
(20,70)-(20,72)
(20,75)-(20,76)
*)

(* all spans
(11,15)-(11,57)
(11,29)-(11,57)
(11,29)-(11,37)
(11,38)-(11,57)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,9)-(17,26)
(17,9)-(17,12)
(17,16)-(17,26)
(17,17)-(17,21)
(17,22)-(17,25)
(19,14)-(20,77)
(20,2)-(20,77)
(20,8)-(20,9)
(20,26)-(20,32)
(20,44)-(20,50)
(20,63)-(20,77)
(20,63)-(20,68)
(20,69)-(20,77)
(20,70)-(20,72)
(20,75)-(20,76)
*)

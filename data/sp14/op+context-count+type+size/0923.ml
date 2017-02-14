
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

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in if y = 2 then y);;


(* fix

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

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(18,31)-(18,46)
(18,34)-(18,35)
(18,34)-(18,39)
(18,38)-(18,39)
(18,45)-(18,46)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(16,2)-(18,47)
(16,2)-(18,47)
(17,7)-(17,59)
(17,11)-(17,24)
(17,11)-(17,28)
(17,11)-(17,28)
(17,12)-(17,16)
(17,27)-(17,28)
(17,34)-(17,40)
(17,34)-(17,43)
(18,7)-(18,47)
(18,7)-(18,47)
(18,16)-(18,20)
(18,16)-(18,27)
(18,31)-(18,46)
(18,31)-(18,46)
(18,31)-(18,46)
(18,45)-(18,46)
*)


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
  else (let y = rand (2, 6) in y = 2);;


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
(18,31)-(18,32)
(18,31)-(18,36)
(18,35)-(18,36)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(16,2)-(18,37)
(16,2)-(18,37)
(17,7)-(17,59)
(17,34)-(17,40)
(17,34)-(17,43)
(18,7)-(18,37)
(18,31)-(18,36)
*)

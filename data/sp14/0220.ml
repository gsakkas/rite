
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

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(18,37)
(16,2)-(18,37)
(16,5)-(16,14)
(16,5)-(16,10)
(16,13)-(16,14)
(17,7)-(17,59)
(17,11)-(17,28)
(17,11)-(17,24)
(17,12)-(17,16)
(17,17)-(17,23)
(17,18)-(17,19)
(17,21)-(17,22)
(17,27)-(17,28)
(17,34)-(17,43)
(17,34)-(17,40)
(17,41)-(17,43)
(17,49)-(17,58)
(17,49)-(17,55)
(17,56)-(17,58)
(18,7)-(18,37)
(18,16)-(18,27)
(18,16)-(18,20)
(18,21)-(18,27)
(18,22)-(18,23)
(18,25)-(18,26)
(18,31)-(18,36)
(18,31)-(18,32)
(18,35)-(18,36)
*)

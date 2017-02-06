
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
  else (let y = rand (2, 6) in if y = 2 then buildX ());;


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
(18,32)-(18,55)
(18,35)-(18,36)
(18,35)-(18,40)
(18,39)-(18,40)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(18,58)
(15,16)-(18,55)
(16,6)-(16,11)
(16,6)-(16,15)
(17,9)-(17,59)
(17,9)-(17,59)
(17,13)-(17,17)
(17,13)-(17,23)
(17,13)-(17,29)
(17,35)-(17,41)
(17,35)-(17,44)
(17,50)-(17,56)
(17,50)-(17,59)
(18,32)-(18,55)
(18,46)-(18,52)
(18,46)-(18,55)
*)

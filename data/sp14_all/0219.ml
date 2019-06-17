
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
(18,32)-(18,47)
buildX ()
AppG [ConAppG Nothing]

*)

(* type error slice
(17,12)-(17,25)
(17,12)-(17,29)
(17,13)-(17,17)
(17,28)-(17,29)
(18,8)-(18,48)
(18,17)-(18,21)
(18,17)-(18,28)
(18,32)-(18,47)
(18,46)-(18,47)
(18,47)-(18,47)
*)

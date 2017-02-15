
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
  let y = rand (2, 6) in
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else if y = 2 then y;;


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
(16,2)-(19,22)
(16,10)-(16,14)
(16,10)-(16,21)
(16,15)-(16,21)
(16,16)-(16,17)
(16,19)-(16,20)
(19,7)-(19,22)
(19,10)-(19,11)
(19,10)-(19,15)
(19,14)-(19,15)
(19,21)-(19,22)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(16,2)-(19,22)
(16,10)-(16,14)
(16,10)-(16,21)
(17,2)-(19,22)
(17,2)-(19,22)
(18,7)-(18,59)
(18,11)-(18,24)
(18,11)-(18,28)
(18,11)-(18,28)
(18,12)-(18,16)
(18,27)-(18,28)
(18,34)-(18,40)
(18,34)-(18,43)
(19,7)-(19,22)
(19,7)-(19,22)
(19,7)-(19,22)
(19,21)-(19,22)
*)

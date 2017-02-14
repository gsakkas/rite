
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
(16,3)-(19,23)
(16,11)-(16,15)
(16,11)-(16,21)
(16,17)-(16,18)
(16,17)-(16,21)
(16,20)-(16,21)
(19,8)-(19,23)
(19,11)-(19,12)
(19,11)-(19,16)
(19,15)-(19,16)
(19,22)-(19,23)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(16,3)-(19,23)
(16,11)-(16,15)
(16,11)-(16,21)
(17,3)-(19,23)
(17,3)-(19,23)
(18,9)-(18,59)
(18,13)-(18,17)
(18,13)-(18,23)
(18,13)-(18,29)
(18,13)-(18,29)
(18,28)-(18,29)
(18,35)-(18,41)
(18,35)-(18,44)
(19,8)-(19,23)
(19,8)-(19,23)
(19,8)-(19,23)
(19,22)-(19,23)
*)

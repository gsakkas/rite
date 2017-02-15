
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
(18,31)-(18,54)
(18,34)-(18,35)
(18,34)-(18,39)
(18,38)-(18,39)
(18,45)-(18,51)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(18,31)-(18,54)
(18,31)-(18,54)
(18,31)-(18,54)
(18,45)-(18,51)
(18,45)-(18,54)
*)

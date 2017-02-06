
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
  if depth = 0 then (if (rand (0, 1)) = 0 then buildX () else buildY ());;


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
(16,3)-(16,72)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(16,75)
(15,16)-(16,72)
(16,3)-(16,72)
(16,6)-(16,11)
(16,6)-(16,15)
(16,22)-(16,72)
(16,22)-(16,72)
(16,26)-(16,30)
(16,26)-(16,36)
(16,26)-(16,42)
(16,48)-(16,54)
(16,48)-(16,57)
(16,63)-(16,69)
(16,63)-(16,72)
*)

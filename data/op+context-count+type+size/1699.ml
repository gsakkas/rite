
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
  match rand (1, 7) with
  | 1 -> buildX (buildY ())
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> buildSine (buildX ())
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;

*)

(* changed spans
(11,12)-(11,21)
(17,10)-(17,16)
(17,18)-(17,24)
(23,10)-(23,16)
(23,17)-(23,19)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(23,21)
(15,16)-(23,19)
(16,3)-(23,19)
(16,9)-(16,13)
(16,9)-(16,19)
(17,10)-(17,16)
(17,10)-(17,27)
(17,18)-(17,24)
(17,18)-(17,27)
(19,10)-(19,16)
(19,10)-(19,19)
(21,10)-(21,16)
(21,10)-(21,19)
(23,10)-(23,16)
(23,10)-(23,19)
*)

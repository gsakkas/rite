
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
(11,11)-(11,20)
(17,9)-(17,15)
(17,17)-(17,23)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(17,9)-(17,15)
(17,9)-(17,27)
(17,16)-(17,27)
(17,17)-(17,23)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(23,18)
(16,2)-(23,18)
(16,8)-(16,19)
(16,8)-(16,12)
(16,13)-(16,19)
(16,14)-(16,15)
(16,17)-(16,18)
(17,9)-(17,27)
(17,9)-(17,15)
(17,16)-(17,27)
(17,17)-(17,23)
(17,24)-(17,26)
(18,9)-(18,18)
(18,9)-(18,15)
(18,16)-(18,18)
(19,9)-(19,18)
(19,9)-(19,15)
(19,16)-(19,18)
(20,9)-(20,18)
(20,9)-(20,15)
(20,16)-(20,18)
(21,9)-(21,18)
(21,9)-(21,15)
(21,16)-(21,18)
(22,9)-(22,18)
(22,9)-(22,15)
(22,16)-(22,18)
(23,9)-(23,18)
(23,9)-(23,15)
(23,16)-(23,18)
*)

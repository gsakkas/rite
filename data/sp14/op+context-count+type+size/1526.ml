
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
(23,9)-(23,15)
(23,16)-(23,18)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,11)-(11,20)
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(17,9)-(17,15)
(17,9)-(17,27)
(17,16)-(17,27)
(17,17)-(17,23)
*)

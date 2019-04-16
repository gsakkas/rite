
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
(17,10)-(17,28)
buildSine (buildX ())
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(17,10)-(17,16)
(17,10)-(17,28)
(17,17)-(17,28)
(17,18)-(17,24)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> VarX
  | 2 -> 22
  | 3 -> 33
  | 4 -> 44
  | 5 -> 55
  | 6 -> 66
  | 7 -> 77;;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;

*)

(* changed spans
(11,15)-(19,11)
(13,9)-(13,13)
(14,9)-(14,11)
(15,9)-(15,11)
(16,9)-(16,11)
(17,9)-(17,11)
(18,9)-(18,11)
(19,9)-(19,11)
*)

(* type error slice
(12,2)-(19,11)
(12,2)-(19,11)
(12,2)-(19,11)
(12,2)-(19,11)
(12,2)-(19,11)
(12,2)-(19,11)
(12,2)-(19,11)
(13,9)-(13,13)
(14,9)-(14,11)
(15,9)-(15,11)
(16,9)-(16,11)
(17,9)-(17,11)
(18,9)-(18,11)
(19,9)-(19,11)
*)

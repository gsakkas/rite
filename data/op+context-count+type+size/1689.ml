
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
(11,16)-(19,12)
(13,10)-(13,14)
(14,10)-(14,12)
(15,10)-(15,12)
(16,10)-(16,12)
(17,10)-(17,12)
(18,10)-(18,12)
(19,10)-(19,12)
*)

(* type error slice
(12,3)-(19,12)
(12,3)-(19,12)
(12,3)-(19,12)
(12,3)-(19,12)
(12,3)-(19,12)
(12,3)-(19,12)
(12,3)-(19,12)
(13,10)-(13,14)
(14,10)-(14,12)
(15,10)-(15,12)
(16,10)-(16,12)
(17,10)-(17,12)
(18,10)-(18,12)
(19,10)-(19,12)
*)

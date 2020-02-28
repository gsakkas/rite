
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

let rec build (rand,depth) =
  match depth with | 0 -> buildX | n -> buildSine (build (rand, (depth - 1)));;


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

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(16,27)-(16,33)
buildX ()
AppG [ConAppG Nothing]

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(16,80)
(15,16)-(16,78)
(16,3)-(16,78)
(16,27)-(16,33)
(16,41)-(16,50)
(16,41)-(16,78)
(16,51)-(16,78)
(16,52)-(16,57)
*)

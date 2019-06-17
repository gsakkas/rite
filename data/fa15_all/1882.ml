
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
  match depth with
  | 0 -> if (rand mod 2) == 0 then buildX else buildY
  | n -> buildSine (build (rand, (depth - 1)));;


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
(19,10)-(19,54)
buildX ()
AppG [ConAppG Nothing]

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(15,4)-(15,23)
(15,12)-(15,21)
(17,4)-(20,49)
(17,16)-(20,47)
(18,3)-(20,47)
(19,10)-(19,54)
(19,48)-(19,54)
(20,10)-(20,19)
(20,10)-(20,47)
(20,20)-(20,47)
(20,21)-(20,26)
*)


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
(15,12)-(15,21)
(15,17)-(15,21)
(19,10)-(19,54)
(19,14)-(19,18)
(19,14)-(19,24)
(19,14)-(19,30)
(19,23)-(19,24)
(19,29)-(19,30)
(19,48)-(19,54)
*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(13,4)-(13,23)
(13,12)-(13,21)
(17,4)-(20,49)
(17,16)-(20,44)
(18,3)-(20,44)
(18,3)-(20,44)
(19,10)-(19,54)
(19,36)-(19,42)
(20,10)-(20,19)
(20,10)-(20,44)
(20,21)-(20,26)
(20,21)-(20,44)
*)

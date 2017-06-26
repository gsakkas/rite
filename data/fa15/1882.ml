
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
(15,11)-(15,20)
(15,16)-(15,20)
(19,9)-(19,53)
(19,12)-(19,24)
(19,12)-(19,29)
(19,13)-(19,17)
(19,22)-(19,23)
(19,28)-(19,29)
(19,47)-(19,53)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(15,3)-(15,22)
(15,11)-(15,20)
(17,3)-(20,48)
(17,15)-(20,46)
(18,2)-(20,46)
(19,9)-(19,53)
(19,47)-(19,53)
(20,9)-(20,18)
(20,9)-(20,46)
(20,19)-(20,46)
(20,20)-(20,25)
*)

(* all spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(20,46)
(18,2)-(20,46)
(18,8)-(18,13)
(19,9)-(19,53)
(19,12)-(19,29)
(19,12)-(19,24)
(19,13)-(19,17)
(19,22)-(19,23)
(19,28)-(19,29)
(19,35)-(19,41)
(19,47)-(19,53)
(20,9)-(20,46)
(20,9)-(20,18)
(20,19)-(20,46)
(20,20)-(20,25)
(20,26)-(20,45)
(20,27)-(20,31)
(20,33)-(20,44)
(20,34)-(20,39)
(20,42)-(20,43)
*)

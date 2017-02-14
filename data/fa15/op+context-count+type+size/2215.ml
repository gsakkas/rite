
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
  | 0 -> if (rand mod 2) = 0 then buildX else buildY
  | n when n > 0 -> buildSine (build (rand, (depth - 1)));;


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
  match depth with
  | 0 -> if true then buildX () else buildY ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(19,14)-(19,18)
(19,14)-(19,24)
(19,14)-(19,29)
(19,23)-(19,24)
(19,28)-(19,29)
(19,35)-(19,41)
(19,47)-(19,53)
(20,21)-(20,55)
*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(13,4)-(13,23)
(13,12)-(13,21)
(17,4)-(20,60)
(17,16)-(20,55)
(18,3)-(20,55)
(18,3)-(20,55)
(19,10)-(19,53)
(19,35)-(19,41)
(20,21)-(20,30)
(20,21)-(20,55)
(20,32)-(20,37)
(20,32)-(20,55)
*)

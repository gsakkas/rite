
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
  | 0 -> ()
  | 1 -> if (rand mod 2) = 0 then buildX else buildY
  | n when n > 1 -> buildSine (build (rand, (depth - 1)));;


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
(18,3)-(21,55)
(19,10)-(19,12)
(20,14)-(20,18)
(20,14)-(20,24)
(20,14)-(20,29)
(20,23)-(20,24)
(20,28)-(20,29)
(20,35)-(20,41)
(20,47)-(20,53)
(21,21)-(21,55)
*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(13,4)-(13,23)
(13,12)-(13,21)
(17,4)-(21,60)
(17,16)-(21,55)
(18,3)-(21,55)
(18,3)-(21,55)
(18,3)-(21,55)
(19,10)-(19,12)
(20,10)-(20,53)
(20,35)-(20,41)
(21,21)-(21,30)
(21,21)-(21,55)
(21,32)-(21,37)
(21,32)-(21,55)
*)

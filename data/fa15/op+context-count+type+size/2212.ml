
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
(18,2)-(21,57)
(19,9)-(19,11)
(20,12)-(20,24)
(20,12)-(20,28)
(20,13)-(20,17)
(20,22)-(20,23)
(20,27)-(20,28)
(20,34)-(20,40)
(20,46)-(20,52)
(21,20)-(21,57)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,3)-(13,22)
(13,11)-(13,20)
(17,3)-(21,59)
(17,15)-(21,57)
(18,2)-(21,57)
(18,2)-(21,57)
(18,2)-(21,57)
(19,9)-(19,11)
(20,9)-(20,52)
(20,34)-(20,40)
(21,20)-(21,29)
(21,20)-(21,57)
(21,30)-(21,57)
(21,31)-(21,36)
*)

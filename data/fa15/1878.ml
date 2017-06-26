
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
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(15,3)-(15,22)
(15,11)-(15,20)
(17,3)-(21,59)
(17,15)-(21,57)
(18,2)-(21,57)
(19,9)-(19,11)
(20,9)-(20,52)
(20,46)-(20,52)
(21,20)-(21,29)
(21,20)-(21,57)
(21,30)-(21,57)
(21,31)-(21,36)
*)

(* all spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(21,57)
(18,2)-(21,57)
(18,8)-(18,13)
(21,11)-(21,16)
(21,11)-(21,12)
(21,15)-(21,16)
(19,9)-(19,11)
(20,9)-(20,52)
(20,12)-(20,28)
(20,12)-(20,24)
(20,13)-(20,17)
(20,22)-(20,23)
(20,27)-(20,28)
(20,34)-(20,40)
(20,46)-(20,52)
(21,20)-(21,57)
(21,20)-(21,29)
(21,30)-(21,57)
(21,31)-(21,36)
(21,37)-(21,56)
(21,38)-(21,42)
(21,44)-(21,55)
(21,45)-(21,50)
(21,53)-(21,54)
*)


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
(19,12)-(19,24)
(19,12)-(19,28)
(19,13)-(19,17)
(19,22)-(19,23)
(19,27)-(19,28)
(19,34)-(19,40)
(19,46)-(19,52)
(20,20)-(20,57)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,3)-(13,22)
(13,11)-(13,20)
(17,3)-(20,59)
(17,15)-(20,57)
(18,2)-(20,57)
(18,2)-(20,57)
(19,9)-(19,52)
(19,34)-(19,40)
(20,20)-(20,29)
(20,20)-(20,57)
(20,30)-(20,57)
(20,31)-(20,36)
*)

(* all spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(20,57)
(18,2)-(20,57)
(18,8)-(18,13)
(19,9)-(19,52)
(19,12)-(19,28)
(19,12)-(19,24)
(19,13)-(19,17)
(19,22)-(19,23)
(19,27)-(19,28)
(19,34)-(19,40)
(19,46)-(19,52)
(20,20)-(20,57)
(20,20)-(20,29)
(20,30)-(20,57)
(20,31)-(20,36)
(20,37)-(20,56)
(20,38)-(20,42)
(20,44)-(20,55)
(20,45)-(20,50)
(20,53)-(20,54)
*)


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
(20,12)-(20,17)
if true
then buildX ()
else buildY ()
IteG LitG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,10)-(19,53)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(15,4)-(15,23)
(15,12)-(15,21)
(17,4)-(20,60)
(17,16)-(20,58)
(18,3)-(20,58)
(19,10)-(19,53)
(19,47)-(19,53)
(20,21)-(20,30)
(20,21)-(20,58)
(20,31)-(20,58)
(20,32)-(20,37)
*)

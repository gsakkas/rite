
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
  | 0 -> if (rand mod 2) == 0 then buildX () () else buildY () ()
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
(19,10)-(19,66)
(19,14)-(19,18)
(19,14)-(19,24)
(19,14)-(19,30)
(19,23)-(19,24)
(19,29)-(19,30)
(19,36)-(19,48)
(19,46)-(19,48)
(19,54)-(19,66)
*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(19,36)-(19,42)
(19,36)-(19,48)
(19,54)-(19,60)
(19,54)-(19,66)
*)

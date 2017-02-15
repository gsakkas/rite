
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
  | 0 -> if rand mod 2 then buildX () else buildY ()
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
(19,9)-(19,52)
(19,12)-(19,16)
(19,12)-(19,22)
(19,21)-(19,22)
(19,43)-(19,49)
(19,50)-(19,52)
(20,9)-(20,18)
*)

(* type error slice
(19,9)-(19,52)
(19,12)-(19,22)
*)

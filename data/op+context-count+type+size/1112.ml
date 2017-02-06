
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> if rand > 1 then buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;

*)

(* changed spans
(20,10)-(20,61)
(20,13)-(20,17)
(20,13)-(20,21)
(20,20)-(20,21)
*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,28)-(11,29)
(13,4)-(13,27)
(13,15)-(13,25)
(13,24)-(13,25)
(15,4)-(15,23)
(15,12)-(15,21)
(17,16)-(21,46)
(18,3)-(21,46)
(18,9)-(18,14)
(19,10)-(19,16)
(19,10)-(19,19)
(20,10)-(20,61)
(20,13)-(20,17)
(20,13)-(20,21)
(20,27)-(20,36)
(20,27)-(20,61)
(20,38)-(20,43)
(20,38)-(20,61)
(20,52)-(20,57)
(21,10)-(21,21)
(21,10)-(21,46)
*)

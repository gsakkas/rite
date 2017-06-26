
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
(20,9)-(20,63)
(20,12)-(20,16)
(20,12)-(20,20)
(20,19)-(20,20)
*)

(* type error slice
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(15,3)-(15,22)
(15,11)-(15,20)
(15,16)-(15,20)
(18,2)-(21,48)
(19,9)-(19,15)
(19,9)-(19,18)
(20,9)-(20,63)
(20,26)-(20,35)
(20,26)-(20,63)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(21,48)
(18,2)-(21,48)
(18,8)-(18,13)
(19,9)-(19,18)
(19,9)-(19,15)
(19,16)-(19,18)
(20,9)-(20,63)
(20,12)-(20,20)
(20,12)-(20,16)
(20,19)-(20,20)
(20,26)-(20,63)
(20,26)-(20,35)
(20,36)-(20,63)
(20,37)-(20,42)
(20,43)-(20,62)
(20,44)-(20,48)
(20,50)-(20,61)
(20,51)-(20,56)
(20,59)-(20,60)
(21,9)-(21,48)
(21,9)-(21,20)
(21,21)-(21,48)
(21,22)-(21,27)
(21,28)-(21,47)
(21,29)-(21,33)
(21,35)-(21,46)
(21,36)-(21,41)
(21,44)-(21,45)
*)

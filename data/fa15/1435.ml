
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)))
  else ();;


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

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(15,15)-(21,9)
(18,4)-(20,56)
(18,10)-(18,14)
(19,16)-(19,53)
(21,7)-(21,9)
*)

(* type error slice
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,3)-(21,11)
(15,15)-(21,9)
(16,2)-(21,9)
(18,4)-(20,56)
(19,16)-(19,25)
(19,16)-(19,53)
(19,26)-(19,53)
(19,27)-(19,32)
(21,7)-(21,9)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,15)-(21,9)
(16,2)-(21,9)
(16,5)-(16,14)
(16,5)-(16,10)
(16,13)-(16,14)
(18,4)-(20,56)
(18,10)-(18,14)
(19,16)-(19,53)
(19,16)-(19,25)
(19,26)-(19,53)
(19,27)-(19,32)
(19,33)-(19,52)
(19,34)-(19,38)
(19,40)-(19,51)
(19,41)-(19,46)
(19,49)-(19,50)
(20,17)-(20,56)
(20,17)-(20,28)
(20,29)-(20,56)
(20,30)-(20,35)
(20,36)-(20,55)
(20,37)-(20,41)
(20,43)-(20,54)
(20,44)-(20,49)
(20,52)-(20,53)
(21,7)-(21,9)
*)

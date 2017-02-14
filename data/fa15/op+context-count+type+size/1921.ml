
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
(15,16)-(21,10)
(18,5)-(20,54)
(18,11)-(18,15)
(19,17)-(19,51)
(20,31)-(20,36)
(20,38)-(20,42)
(20,38)-(20,54)
(20,45)-(20,50)
(20,45)-(20,54)
(20,53)-(20,54)
(21,8)-(21,10)
*)

(* type error slice
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(16,3)-(21,10)
(16,3)-(21,10)
(18,5)-(20,54)
(19,17)-(19,26)
(19,17)-(19,51)
(21,8)-(21,10)
*)

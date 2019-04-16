
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
(18,5)-(20,57)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(21,8)-(21,10)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(15,4)-(21,12)
(15,16)-(21,10)
(16,3)-(21,10)
(18,5)-(20,57)
(19,17)-(19,26)
(19,17)-(19,54)
(19,27)-(19,54)
(19,28)-(19,33)
(21,8)-(21,10)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  let randNum2 = rand (3, 4) in
  if (randNum = 1) && (randNum2 = 3)
  then buildSine (buildOp1 (buildX ()))
  else
    if (randNum = 1) && (randNum2 = 4)
    then buildSine (buildOp2 (buildX ()))
    else
      if (randNum = 2) && (randNum2 = 3)
      then buildCosine (buildOp1 (buildX ()))
      else buildCosine (buildOp2 (buildX ()));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0 then buildSine (buildX ()) else buildX ();;

*)

(* changed spans
(13,21)-(13,29)
(13,28)-(13,29)
(15,14)-(15,23)
(15,18)-(15,23)
(15,22)-(15,23)
(17,15)-(17,53)
(17,36)-(17,53)
(17,41)-(17,42)
(17,44)-(17,45)
(17,47)-(17,53)
(19,15)-(19,25)
(24,3)-(34,44)
(24,17)-(24,27)
(25,3)-(34,44)
*)

(* type error slice
(17,4)-(17,56)
(17,15)-(17,53)
(17,36)-(17,53)
(17,41)-(17,42)
(17,44)-(17,45)
(17,47)-(17,53)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(30,21)-(30,29)
(30,21)-(30,40)
(30,31)-(30,37)
(30,31)-(30,40)
(30,38)-(30,40)
(34,25)-(34,33)
(34,25)-(34,44)
(34,35)-(34,41)
(34,35)-(34,44)
(34,42)-(34,44)
*)

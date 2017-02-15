
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
(13,20)-(13,28)
(13,27)-(13,28)
(15,13)-(15,22)
(15,17)-(15,22)
(15,21)-(15,22)
(17,14)-(17,53)
(17,35)-(17,53)
(17,40)-(17,41)
(17,43)-(17,44)
(17,46)-(17,52)
(19,14)-(19,24)
(24,2)-(34,45)
(24,16)-(24,27)
(24,21)-(24,27)
(25,2)-(34,45)
*)

(* type error slice
(17,3)-(17,55)
(17,14)-(17,53)
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(30,19)-(30,41)
(30,20)-(30,28)
(30,29)-(30,40)
(30,30)-(30,36)
(34,23)-(34,45)
(34,24)-(34,32)
(34,33)-(34,44)
(34,34)-(34,40)
*)

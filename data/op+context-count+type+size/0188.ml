
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
  if depth > (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildCosine (buildOp1 (buildX ()))
     else
       if (randNum = 1) && (randNum2 = 4)
       then
         buildSine
           (buildOp2
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                (build (rand, (depth - 1))))));;


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
(24,3)-(36,41)
(24,6)-(24,17)
(26,5)-(36,41)
*)

(* type error slice
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,25)
(15,14)-(15,23)
(15,18)-(15,23)
(15,22)-(15,23)
(17,4)-(17,56)
(17,15)-(17,53)
(17,36)-(17,53)
(17,41)-(17,42)
(17,44)-(17,45)
(17,47)-(17,53)
(19,4)-(19,27)
(19,15)-(19,25)
(19,19)-(19,25)
(19,24)-(19,25)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(24,3)-(36,41)
(26,5)-(36,41)
(26,19)-(26,23)
(26,19)-(26,29)
(26,25)-(26,26)
(26,25)-(26,29)
(26,28)-(26,29)
(27,5)-(36,41)
(28,6)-(36,41)
(29,11)-(29,22)
(29,11)-(29,43)
(29,24)-(29,32)
(29,24)-(29,43)
(29,34)-(29,40)
(29,34)-(29,43)
(29,41)-(29,43)
(31,8)-(36,41)
(33,10)-(33,19)
(33,10)-(36,41)
(34,13)-(34,21)
(34,13)-(36,41)
(35,17)-(35,22)
(35,17)-(35,40)
(35,17)-(36,41)
(35,24)-(35,28)
(35,24)-(35,40)
(35,31)-(35,40)
(35,46)-(35,51)
(35,46)-(35,69)
(35,53)-(35,57)
(35,53)-(35,69)
(35,60)-(35,69)
(36,18)-(36,23)
(36,18)-(36,41)
(36,25)-(36,29)
(36,25)-(36,41)
(36,32)-(36,41)
*)


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
(24,5)-(24,17)
(24,13)-(24,17)
(26,4)-(36,46)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(17,3)-(17,55)
(17,14)-(17,53)
(19,3)-(19,26)
(19,14)-(19,24)
(19,18)-(19,24)
(24,2)-(36,46)
(24,2)-(36,46)
(24,2)-(36,46)
(26,4)-(36,46)
(27,4)-(36,46)
(28,4)-(36,46)
(29,10)-(29,21)
(29,10)-(29,44)
(31,7)-(36,45)
(31,7)-(36,45)
(31,7)-(36,45)
(33,9)-(33,18)
(33,9)-(36,45)
(34,11)-(36,45)
(34,12)-(34,20)
(35,14)-(36,44)
*)


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

let buildOp1 e = Op1 e;;

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildSine (buildOp1 (buildX ()))
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
(13,18)-(13,23)
(13,22)-(13,23)
(15,15)-(15,53)
(15,36)-(15,53)
(15,41)-(15,42)
(15,44)-(15,45)
(15,47)-(15,53)
(17,15)-(17,25)
(22,3)-(34,41)
(22,15)-(22,17)
(24,5)-(34,41)
*)

(* type error slice
(15,4)-(15,56)
(15,15)-(15,53)
(17,4)-(17,27)
(17,15)-(17,25)
(17,19)-(17,25)
(22,3)-(34,41)
(22,3)-(34,41)
(22,3)-(34,41)
(24,5)-(34,41)
(25,5)-(34,41)
(26,6)-(34,41)
(27,11)-(27,20)
(27,11)-(27,41)
(29,8)-(34,41)
(29,8)-(34,41)
(29,8)-(34,41)
(31,10)-(31,19)
(31,10)-(34,41)
(32,13)-(32,21)
(32,13)-(34,41)
(33,17)-(34,41)
*)

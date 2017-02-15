
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
(13,17)-(13,22)
(13,21)-(13,22)
(15,14)-(15,53)
(15,35)-(15,53)
(15,40)-(15,41)
(15,43)-(15,44)
(15,46)-(15,52)
(17,14)-(17,24)
(22,13)-(22,17)
(24,4)-(34,46)
(24,18)-(24,22)
(24,18)-(24,29)
*)

(* type error slice
(15,3)-(15,55)
(15,14)-(15,53)
(17,3)-(17,26)
(17,14)-(17,24)
(17,18)-(17,24)
(22,2)-(34,46)
(22,2)-(34,46)
(22,2)-(34,46)
(24,4)-(34,46)
(25,4)-(34,46)
(26,4)-(34,46)
(27,10)-(27,19)
(27,10)-(27,42)
(29,7)-(34,45)
(29,7)-(34,45)
(29,7)-(34,45)
(31,9)-(31,18)
(31,9)-(34,45)
(32,11)-(34,45)
(32,12)-(32,20)
(33,14)-(34,44)
*)

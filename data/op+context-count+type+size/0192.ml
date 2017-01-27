
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

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildX ()
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
(13,15)-(13,53)
(13,36)-(13,53)
(13,41)-(13,42)
(13,44)-(13,45)
(13,47)-(13,53)
(20,3)-(32,41)
(20,15)-(20,17)
(22,5)-(32,41)
(22,19)-(22,23)
(22,25)-(22,29)
(23,5)-(32,41)
*)

(* type error slice
(13,4)-(13,56)
(13,15)-(13,53)
(13,36)-(13,53)
(13,41)-(13,42)
(13,44)-(13,45)
(13,47)-(13,53)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,23)
(17,12)-(17,21)
(17,17)-(17,21)
(20,3)-(32,41)
(22,5)-(32,41)
(22,19)-(22,23)
(22,19)-(22,29)
(22,25)-(22,26)
(22,25)-(22,29)
(22,28)-(22,29)
(23,5)-(32,41)
(24,6)-(32,41)
(25,11)-(25,17)
(25,11)-(25,20)
(25,18)-(25,20)
(27,8)-(32,41)
(29,10)-(29,19)
(29,10)-(32,41)
(30,13)-(30,21)
(30,13)-(32,41)
(31,17)-(31,22)
(31,17)-(31,40)
(31,17)-(32,41)
(31,24)-(31,28)
(31,24)-(31,40)
(31,31)-(31,40)
(31,46)-(31,51)
(31,46)-(31,69)
(31,53)-(31,57)
(31,53)-(31,69)
(31,60)-(31,69)
(32,18)-(32,23)
(32,18)-(32,41)
(32,25)-(32,29)
(32,25)-(32,41)
(32,32)-(32,41)
*)

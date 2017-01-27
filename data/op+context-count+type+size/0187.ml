
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

let rec build (rand,depth) =
  if depth = (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildSine (build (rand, (depth - 1)))
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
(17,16)-(30,41)
(18,3)-(30,41)
(18,15)-(18,17)
(20,5)-(30,41)
(20,19)-(20,23)
(20,25)-(20,26)
(20,25)-(20,29)
(20,28)-(20,29)
(21,5)-(30,41)
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
(18,3)-(30,41)
(20,5)-(30,41)
(20,19)-(20,23)
(20,19)-(20,29)
(20,25)-(20,26)
(20,25)-(20,29)
(20,28)-(20,29)
(21,5)-(30,41)
(22,6)-(30,41)
(23,11)-(23,20)
(23,11)-(23,45)
(23,22)-(23,27)
(23,22)-(23,45)
(23,29)-(23,33)
(23,29)-(23,45)
(23,36)-(23,45)
(25,8)-(30,41)
(27,10)-(27,19)
(27,10)-(30,41)
(28,13)-(28,21)
(28,13)-(30,41)
(29,17)-(29,22)
(29,17)-(29,40)
(29,17)-(30,41)
(29,24)-(29,28)
(29,24)-(29,40)
(29,31)-(29,40)
(29,46)-(29,51)
(29,46)-(29,69)
(29,53)-(29,57)
(29,53)-(29,69)
(29,60)-(29,69)
(30,18)-(30,23)
(30,18)-(30,41)
(30,25)-(30,29)
(30,25)-(30,41)
(30,32)-(30,41)
*)


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
(13,14)-(13,53)
(13,35)-(13,53)
(13,40)-(13,41)
(13,43)-(13,44)
(13,46)-(13,52)
(17,15)-(30,46)
(18,13)-(18,17)
(20,4)-(30,46)
(20,18)-(20,22)
(20,23)-(20,29)
(20,24)-(20,25)
(20,27)-(20,28)
(21,4)-(30,46)
(21,19)-(21,23)
(21,19)-(21,30)
*)

(* type error slice
(13,3)-(13,55)
(13,14)-(13,53)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(18,2)-(30,46)
(18,2)-(30,46)
(18,2)-(30,46)
(20,4)-(30,46)
(21,4)-(30,46)
(22,4)-(30,46)
(23,10)-(23,19)
(23,10)-(23,47)
(25,7)-(30,45)
(25,7)-(30,45)
(25,7)-(30,45)
(27,9)-(27,18)
(27,9)-(30,45)
(28,11)-(30,45)
(28,12)-(28,20)
(29,14)-(30,44)
*)

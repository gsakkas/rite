
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
  if depth > (-1)
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
(13,14)-(13,53)
(13,35)-(13,53)
(13,40)-(13,41)
(13,43)-(13,44)
(13,46)-(13,52)
(20,5)-(20,17)
(20,13)-(20,17)
(22,4)-(32,46)
(22,18)-(22,22)
(22,23)-(22,29)
(22,27)-(22,28)
(23,4)-(32,46)
*)

(* type error slice
(13,3)-(13,55)
(13,14)-(13,53)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(17,3)-(17,22)
(17,11)-(17,20)
(17,16)-(17,20)
(20,2)-(32,46)
(20,2)-(32,46)
(20,2)-(32,46)
(22,4)-(32,46)
(23,4)-(32,46)
(24,4)-(32,46)
(25,10)-(25,16)
(25,10)-(25,19)
(27,7)-(32,45)
(27,7)-(32,45)
(27,7)-(32,45)
(29,9)-(29,18)
(29,9)-(32,45)
(30,11)-(32,45)
(30,12)-(30,20)
(31,14)-(32,44)
*)

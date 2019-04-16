
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

let rec build (rand,depth) =
  if depth = (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildSine (buildOp1 (build (rand, (depth - 1))))
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
(20,14)-(20,18)
0
LitG

(22,5)-(32,47)
buildSine (buildX ())
AppG (fromList [AppG (fromList [EmptyG])])

(32,47)-(32,47)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(13,4)-(13,25)
(13,14)-(13,23)
(13,18)-(13,23)
(13,22)-(13,23)
(15,4)-(15,56)
(15,15)-(15,54)
(17,4)-(17,27)
(17,15)-(17,25)
(17,19)-(17,25)
(19,4)-(32,49)
(19,16)-(32,47)
(20,3)-(32,47)
(25,21)-(25,59)
(25,22)-(25,30)
(25,31)-(25,58)
(25,32)-(25,37)
(27,8)-(32,46)
(29,10)-(29,19)
(29,10)-(32,46)
(30,12)-(32,46)
(30,13)-(30,21)
(31,15)-(32,45)
(32,46)-(32,46)
(32,47)-(32,47)
*)


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
(18,14)-(18,18)
0
LitG

(20,5)-(30,47)
buildSine (buildX ())
AppG (fromList [AppG (fromList [EmptyG])])

(30,47)-(30,47)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(13,4)-(13,56)
(13,15)-(13,54)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(30,49)
(17,16)-(30,47)
(18,3)-(30,47)
(23,11)-(23,20)
(23,11)-(23,48)
(23,21)-(23,48)
(23,22)-(23,27)
(25,8)-(30,46)
(27,10)-(27,19)
(27,10)-(30,46)
(28,12)-(30,46)
(28,13)-(28,21)
(29,15)-(30,45)
(30,46)-(30,46)
(30,47)-(30,47)
*)

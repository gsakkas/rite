
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
    match (randNum, randNum2) with
    | (1,3) -> failwith "bahh"
    | (1,4) ->
        buildSine
          (buildOp2
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1)))))
    | (2,3) -> buildCosine (buildOp1 (buildX ()))
    | (2,4) ->
        buildCosine
          (buildOp2
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1)))))
    | (x,y) -> failwith "didnt work";;


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
(24,6)-(24,18)
depth = 0
BopG VarG LitG

(26,5)-(41,37)
buildSine (buildX ())
AppG (fromList [AppG (fromList [EmptyG])])

(41,37)-(41,37)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(17,4)-(17,56)
(17,15)-(17,54)
(19,4)-(19,27)
(19,15)-(19,25)
(19,19)-(19,25)
(24,3)-(41,37)
(26,5)-(41,37)
(27,5)-(41,37)
(28,5)-(41,37)
(31,9)-(31,18)
(31,9)-(34,45)
(32,11)-(34,45)
(32,12)-(32,20)
(33,14)-(34,44)
(38,11)-(40,45)
(38,12)-(38,20)
(39,14)-(40,44)
(41,37)-(41,37)
*)

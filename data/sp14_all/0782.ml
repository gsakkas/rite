
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

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildSine (buildX ())
  else
    (let randNum = rand (1, 2) in
     let randNum2 = rand (1, 2) in
     let randNum3 = rand (1, 2) in
     match (randNum, randNum2) with
     | (1,1) -> buildSine (buildX ())
     | (2,2) -> buildCosine (buildX ())
     | _ ->
         (match randNum3 with
          | 1 ->
              buildSine
                (buildOp2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))
          | 2 ->
              buildCosine
                (buildOp2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))));;


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

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildSine (buildX ())
  else
    (let randNum = rand (1, 2) in
     let randNum2 = rand (1, 2) in
     let randNum3 = rand (1, 2) in
     match (randNum, randNum2) with
     | (1,1) -> buildSine (build (rand, (depth - 1)))
     | (2,2) -> buildCosine (build (rand, (depth - 1)))
     | _ ->
         (match randNum3 with
          | 1 -> buildSine (buildOp1 (build (rand, (depth - 1))))
          | 2 -> buildCosine (buildOp1 (build (rand, (depth - 1))))));;

*)

(* changed spans
(29,27)-(29,38)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,29)-(30,40)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,17)-(37,51)
buildOp1 (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(40,17)-(42,51)
buildOp1 (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(15,4)-(15,56)
(15,15)-(15,54)
(35,17)-(37,51)
(35,18)-(35,26)
(36,20)-(37,50)
(40,17)-(42,51)
(40,18)-(40,26)
(41,20)-(42,50)
*)

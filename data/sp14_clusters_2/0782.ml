
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
(17,18)-(17,24)
e
VarG

(17,18)-(17,24)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(17,18)-(17,24)
Op1 e
ConAppG (Just VarG) Nothing

(36,72)-(36,73)
buildCosine
VarG

(39,14)-(39,25)
buildSine
VarG

(39,14)-(42,50)
randNum3
VarG

(39,14)-(42,50)
match randNum3 with
| 1 -> buildSine (buildOp1 (build (rand , depth - 1)))
| 2 -> buildCosine (buildOp1 (build (rand , depth - 1)))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(41,19)-(42,49)
buildOp1
VarG

(41,72)-(41,73)
buildCosine
VarG

(42,22)-(42,27)
buildOp1
VarG

(42,22)-(42,27)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

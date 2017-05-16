
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
    | (1,3) -> buildCosine (buildOp1 (buildX rand))
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

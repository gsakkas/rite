
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
  let randNum = rand (1, 2) in
  let randNum2 = rand (3, 4) in
  if (randNum = 1) && (randNum2 = 3)
  then buildSine (buildOp1 (buildX ()))
  else
    if (randNum = 1) && (randNum2 = 4)
    then buildSine (buildOp2 (buildX ()))
    else
      if (randNum = 2) && (randNum2 = 3)
      then buildCosine (buildOp1 (buildX ()))
      else buildCosine (buildOp2 (buildX ()));;


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


(* changed spans
(13,5)-(19,4)
(24,3)-(25,32)
(26,6)-(26,32)
(26,35)-(26,37)
(27,19)-(27,29)
(27,39)-(27,40)
(29,5)-(30,31)
(30,40)-(34,46)
*)

(* type error slice
(30,21)-(30,40)
*)

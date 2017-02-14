
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  if randNum = 1 then buildSine (buildY ()) else buildCosine buildY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  if randNum = 1 then buildSine (buildX ()) else buildCosine (buildY ());;

*)

(* changed spans
(15,16)-(15,20)
(18,2)-(19,67)
(19,33)-(19,39)
(19,61)-(19,67)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(15,3)-(15,22)
(15,11)-(15,20)
(19,49)-(19,60)
(19,49)-(19,67)
(19,61)-(19,67)
*)

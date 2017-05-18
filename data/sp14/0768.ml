
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

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(19,67)
(18,2)-(19,67)
(18,16)-(18,27)
(18,16)-(18,20)
(18,21)-(18,27)
(18,22)-(18,23)
(18,25)-(18,26)
(19,2)-(19,67)
(19,5)-(19,16)
(19,5)-(19,12)
(19,15)-(19,16)
(19,22)-(19,43)
(19,22)-(19,31)
(19,32)-(19,43)
(19,33)-(19,39)
(19,40)-(19,42)
(19,49)-(19,67)
(19,49)-(19,60)
(19,61)-(19,67)
*)

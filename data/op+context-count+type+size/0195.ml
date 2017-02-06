
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
(15,17)-(15,21)
(19,34)-(19,40)
(19,62)-(19,68)
*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,21)-(11,29)
(11,28)-(11,29)
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(15,4)-(15,23)
(15,12)-(15,21)
(15,12)-(15,21)
(15,17)-(15,21)
(17,4)-(19,70)
(17,16)-(19,68)
(18,3)-(19,68)
(18,3)-(19,68)
(18,17)-(18,21)
(18,17)-(18,27)
(18,17)-(18,27)
(18,23)-(18,24)
(18,23)-(18,27)
(18,26)-(18,27)
(19,3)-(19,68)
(19,3)-(19,68)
(19,6)-(19,13)
(19,6)-(19,17)
(19,6)-(19,17)
(19,6)-(19,17)
(19,16)-(19,17)
(19,23)-(19,32)
(19,23)-(19,43)
(19,23)-(19,43)
(19,34)-(19,40)
(19,34)-(19,43)
(19,41)-(19,43)
(19,50)-(19,61)
(19,50)-(19,68)
(19,50)-(19,68)
(19,62)-(19,68)
*)

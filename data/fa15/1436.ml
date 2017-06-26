
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)));;


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
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(15,15)-(20,50)
(16,2)-(20,50)
*)

(* type error slice
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,3)-(20,52)
(15,15)-(20,50)
(16,2)-(20,50)
(18,4)-(20,50)
(19,11)-(19,20)
(19,11)-(19,48)
(19,21)-(19,48)
(19,22)-(19,27)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,15)-(20,50)
(16,2)-(20,50)
(16,5)-(16,14)
(16,5)-(16,10)
(16,13)-(16,14)
(18,4)-(20,50)
(18,10)-(18,21)
(18,10)-(18,14)
(18,15)-(18,21)
(18,16)-(18,17)
(18,19)-(18,20)
(19,11)-(19,48)
(19,11)-(19,20)
(19,21)-(19,48)
(19,22)-(19,27)
(19,28)-(19,47)
(19,29)-(19,33)
(19,35)-(19,46)
(19,36)-(19,41)
(19,44)-(19,45)
(20,11)-(20,50)
(20,11)-(20,22)
(20,23)-(20,50)
(20,24)-(20,29)
(20,30)-(20,49)
(20,31)-(20,35)
(20,37)-(20,48)
(20,38)-(20,43)
(20,46)-(20,47)
*)


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
    match rand with
    | (0,2) -> buildX (build (rand, (depth - 1)))
    | (3,5) -> buildY ()
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)));;


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
(20,3)-(26,54)
(22,5)-(26,54)
(22,11)-(22,15)
(23,16)-(23,22)
(23,16)-(23,47)
(23,24)-(23,29)
(23,31)-(23,47)
(23,38)-(23,43)
(23,38)-(23,47)
(23,46)-(23,47)
(24,16)-(24,22)
(24,16)-(24,25)
(24,23)-(24,25)
(25,17)-(25,51)
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
(19,4)-(26,59)
(19,16)-(26,54)
(20,3)-(26,54)
(20,3)-(26,54)
(20,3)-(26,54)
(22,5)-(26,54)
(23,16)-(23,22)
(23,16)-(23,47)
(23,24)-(23,29)
(23,24)-(23,47)
(25,17)-(25,26)
(25,17)-(25,51)
(25,28)-(25,33)
(25,28)-(25,51)
(26,18)-(26,29)
(26,18)-(26,54)
(26,31)-(26,36)
(26,31)-(26,54)
*)

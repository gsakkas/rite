
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
    | (0,2) -> buildX ()
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
(20,2)-(26,56)
(22,4)-(26,56)
(22,10)-(22,14)
(23,15)-(23,21)
(23,15)-(23,24)
(23,22)-(23,24)
(24,15)-(24,21)
(24,22)-(24,24)
(25,16)-(25,53)
*)

(* type error slice
(15,3)-(15,22)
(15,11)-(15,20)
(15,16)-(15,20)
(20,2)-(26,56)
(22,4)-(26,56)
(23,15)-(23,21)
(23,15)-(23,24)
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
(17,11)-(17,20)
(17,16)-(17,20)
(19,15)-(26,56)
(20,2)-(26,56)
(20,5)-(20,14)
(20,5)-(20,10)
(20,13)-(20,14)
(22,4)-(26,56)
(22,10)-(22,14)
(23,15)-(23,24)
(23,15)-(23,21)
(23,22)-(23,24)
(24,15)-(24,24)
(24,15)-(24,21)
(24,22)-(24,24)
(25,16)-(25,53)
(25,16)-(25,25)
(25,26)-(25,53)
(25,27)-(25,32)
(25,33)-(25,52)
(25,34)-(25,38)
(25,40)-(25,51)
(25,41)-(25,46)
(25,49)-(25,50)
(26,17)-(26,56)
(26,17)-(26,28)
(26,29)-(26,56)
(26,30)-(26,35)
(26,36)-(26,55)
(26,37)-(26,41)
(26,43)-(26,54)
(26,44)-(26,49)
(26,52)-(26,53)
*)

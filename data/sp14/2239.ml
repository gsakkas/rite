
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
    match rand (0, 6) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build rand (depth - 1))
    | 3 -> buildCosine (build rand (depth - 1))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


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
    match rand (0, 6) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(25,21)-(25,45)
(25,28)-(25,32)
(26,23)-(26,47)
(26,30)-(26,34)
*)

(* type error slice
(19,3)-(27,67)
(19,15)-(27,65)
(25,21)-(25,45)
(25,22)-(25,27)
(25,28)-(25,32)
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
(19,15)-(27,65)
(20,2)-(27,65)
(20,5)-(20,14)
(20,5)-(20,10)
(20,13)-(20,14)
(22,4)-(26,47)
(22,10)-(22,21)
(22,10)-(22,14)
(22,15)-(22,21)
(22,16)-(22,17)
(22,19)-(22,20)
(23,11)-(23,20)
(23,11)-(23,17)
(23,18)-(23,20)
(24,11)-(24,20)
(24,11)-(24,17)
(24,18)-(24,20)
(25,11)-(25,45)
(25,11)-(25,20)
(25,21)-(25,45)
(25,22)-(25,27)
(25,28)-(25,32)
(25,33)-(25,44)
(25,34)-(25,39)
(25,42)-(25,43)
(26,11)-(26,47)
(26,11)-(26,22)
(26,23)-(26,47)
(26,24)-(26,29)
(26,30)-(26,34)
(26,35)-(26,46)
(26,36)-(26,41)
(26,44)-(26,45)
(27,7)-(27,65)
(27,14)-(27,25)
(27,14)-(27,18)
(27,19)-(27,25)
(27,20)-(27,21)
(27,23)-(27,24)
(27,38)-(27,47)
(27,38)-(27,44)
(27,45)-(27,47)
(27,55)-(27,64)
(27,55)-(27,61)
(27,62)-(27,64)
*)

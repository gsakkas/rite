
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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else
    (let num = rand (0, 4) in
     if num = 0
     then buildSine (build (rand, (depth - 1)))
     else if num = 1 then buildCosine (build (rand, (depth - 1))));;


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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else
    (let num = rand (0, 4) in
     if num = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if num = 1 then buildCosine (build (rand, (depth - 1))) else buildX ());;

*)

(* changed spans
(26,10)-(26,65)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(11,20)-(11,28)
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(17,3)-(17,22)
(17,11)-(17,20)
(17,16)-(17,20)
(20,2)-(26,66)
(21,7)-(21,59)
(21,49)-(21,55)
(21,49)-(21,58)
(23,4)-(26,66)
(24,5)-(26,65)
(25,10)-(25,19)
(25,10)-(25,47)
(26,10)-(26,65)
(26,26)-(26,37)
(26,26)-(26,65)
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
(19,15)-(26,66)
(20,2)-(26,66)
(20,5)-(20,14)
(20,5)-(20,10)
(20,13)-(20,14)
(21,7)-(21,59)
(21,11)-(21,28)
(21,11)-(21,24)
(21,12)-(21,16)
(21,17)-(21,23)
(21,18)-(21,19)
(21,21)-(21,22)
(21,27)-(21,28)
(21,34)-(21,43)
(21,34)-(21,40)
(21,41)-(21,43)
(21,49)-(21,58)
(21,49)-(21,55)
(21,56)-(21,58)
(23,4)-(26,66)
(23,15)-(23,26)
(23,15)-(23,19)
(23,20)-(23,26)
(23,21)-(23,22)
(23,24)-(23,25)
(24,5)-(26,65)
(24,8)-(24,15)
(24,8)-(24,11)
(24,14)-(24,15)
(25,10)-(25,47)
(25,10)-(25,19)
(25,20)-(25,47)
(25,21)-(25,26)
(25,27)-(25,46)
(25,28)-(25,32)
(25,34)-(25,45)
(25,35)-(25,40)
(25,43)-(25,44)
(26,10)-(26,65)
(26,13)-(26,20)
(26,13)-(26,16)
(26,19)-(26,20)
(26,26)-(26,65)
(26,26)-(26,37)
(26,38)-(26,65)
(26,39)-(26,44)
(26,45)-(26,64)
(26,46)-(26,50)
(26,52)-(26,63)
(26,53)-(26,58)
(26,61)-(26,62)
*)


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
(26,66)-(26,66)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,21)-(11,29)
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(17,4)-(17,23)
(17,12)-(17,21)
(17,17)-(17,21)
(20,3)-(26,67)
(21,8)-(21,60)
(21,50)-(21,56)
(21,50)-(21,59)
(23,5)-(26,67)
(24,6)-(26,66)
(25,11)-(25,20)
(25,11)-(25,48)
(26,11)-(26,66)
(26,27)-(26,38)
(26,27)-(26,66)
(26,66)-(26,66)
*)

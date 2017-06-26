
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
  let r = rand 0.4 in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildSine (build (rand, (d - 1)))
      else buildCosine (build (rand, (d - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;

*)

(* changed spans
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(20,15)-(20,18)
(21,2)-(26,46)
(22,31)-(22,37)
(22,43)-(22,49)
(24,6)-(26,46)
(25,36)-(25,37)
(26,11)-(26,22)
(26,23)-(26,46)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(11,20)-(11,28)
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(17,3)-(17,22)
(17,11)-(17,20)
(19,3)-(26,48)
(19,15)-(26,46)
(20,2)-(26,46)
(21,2)-(26,46)
(22,9)-(22,49)
(22,43)-(22,49)
(24,6)-(26,46)
(25,11)-(25,20)
(25,11)-(25,44)
(25,21)-(25,44)
(25,22)-(25,27)
(26,11)-(26,22)
(26,11)-(26,46)
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
(19,15)-(26,46)
(20,2)-(26,46)
(20,10)-(20,18)
(20,10)-(20,14)
(20,15)-(20,18)
(21,2)-(26,46)
(21,8)-(21,13)
(22,9)-(22,49)
(22,12)-(22,25)
(22,12)-(22,21)
(22,13)-(22,14)
(22,19)-(22,20)
(22,24)-(22,25)
(22,31)-(22,37)
(22,43)-(22,49)
(24,6)-(26,46)
(24,9)-(24,14)
(24,9)-(24,10)
(24,13)-(24,14)
(25,11)-(25,44)
(25,11)-(25,20)
(25,21)-(25,44)
(25,22)-(25,27)
(25,28)-(25,43)
(25,29)-(25,33)
(25,35)-(25,42)
(25,36)-(25,37)
(25,40)-(25,41)
(26,11)-(26,46)
(26,11)-(26,22)
(26,23)-(26,46)
(26,24)-(26,29)
(26,30)-(26,45)
(26,31)-(26,35)
(26,37)-(26,44)
(26,38)-(26,39)
(26,42)-(26,43)
*)

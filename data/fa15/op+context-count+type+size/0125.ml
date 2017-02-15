
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
      then buildSine build (r, (d - 1))
      else buildCosine build (r, (d - 1));;


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
(20,2)-(26,41)
(20,15)-(20,18)
(21,2)-(26,41)
(22,31)-(22,37)
(22,43)-(22,49)
(24,6)-(26,41)
(25,11)-(25,39)
(25,21)-(25,26)
(25,28)-(25,29)
(25,32)-(25,33)
(26,11)-(26,22)
(26,11)-(26,41)
(26,30)-(26,31)
(26,34)-(26,35)
(26,38)-(26,39)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(11,20)-(11,28)
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(19,3)-(26,43)
(19,15)-(26,41)
(25,11)-(25,20)
(25,11)-(25,39)
(25,21)-(25,26)
(26,11)-(26,22)
(26,11)-(26,41)
*)

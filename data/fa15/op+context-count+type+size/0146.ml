
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
(11,21)-(11,29)
(11,28)-(11,29)
(13,15)-(13,25)
(20,3)-(26,40)
(20,16)-(20,19)
(21,3)-(26,40)
(22,32)-(22,38)
(22,44)-(22,50)
(24,7)-(26,40)
(25,12)-(25,38)
(25,22)-(25,27)
(25,29)-(25,30)
(25,33)-(25,34)
(26,12)-(26,23)
(26,12)-(26,40)
(26,31)-(26,32)
(26,35)-(26,36)
(26,39)-(26,40)
*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,21)-(11,29)
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(19,4)-(26,44)
(19,16)-(26,40)
(25,12)-(25,21)
(25,12)-(25,38)
(25,22)-(25,27)
(26,12)-(26,23)
(26,12)-(26,40)
*)


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
(20,16)-(20,19)
(0 , depth)
TupleG (fromList [VarG,LitG])

(22,32)-(22,38)
buildX ()
AppG (fromList [ConAppG Nothing])

(22,44)-(22,50)
buildY ()
AppG (fromList [ConAppG Nothing])

(25,37)-(25,38)
depth
VarG

(26,12)-(26,47)
build (rand , d - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,21)-(11,29)
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(17,4)-(17,23)
(17,12)-(17,21)
(19,4)-(26,49)
(19,16)-(26,47)
(20,3)-(26,47)
(21,3)-(26,47)
(22,10)-(22,50)
(22,44)-(22,50)
(24,7)-(26,47)
(25,12)-(25,21)
(25,12)-(25,45)
(25,22)-(25,45)
(25,23)-(25,28)
(26,12)-(26,23)
(26,12)-(26,47)
*)

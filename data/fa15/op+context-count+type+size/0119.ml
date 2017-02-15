
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0. depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d -> if r = 0 then build (rand, (d - 1)) else build (rand, (d - 1));;


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
(11,11)-(11,20)
(16,2)-(19,71)
(16,15)-(16,25)
(16,16)-(16,18)
(16,19)-(16,24)
(18,31)-(18,37)
(18,43)-(18,49)
(19,9)-(19,71)
(19,23)-(19,28)
(19,29)-(19,44)
(19,30)-(19,34)
(19,36)-(19,43)
(19,37)-(19,38)
(19,41)-(19,42)
(19,64)-(19,65)
*)

(* type error slice
(16,15)-(16,25)
(16,16)-(16,18)
*)

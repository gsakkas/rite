
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
(11,12)-(11,21)
(16,3)-(19,70)
(16,17)-(16,19)
(16,17)-(16,25)
(16,20)-(16,25)
(18,32)-(18,38)
(18,44)-(18,50)
(19,10)-(19,70)
(19,24)-(19,29)
(19,31)-(19,35)
(19,31)-(19,43)
(19,38)-(19,39)
(19,38)-(19,43)
(19,42)-(19,43)
(19,65)-(19,66)
*)

(* type error slice
(16,17)-(16,19)
(16,17)-(16,25)
*)


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
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;


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
(20,32)-(20,38)
buildX ()
AppG [ConAppG Nothing]

(20,44)-(20,50)
buildY ()
AppG [ConAppG Nothing]

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(15,4)-(15,23)
(15,12)-(15,21)
(17,4)-(24,35)
(17,16)-(24,33)
(18,3)-(24,33)
(19,3)-(24,33)
(20,10)-(20,50)
(20,44)-(20,50)
(22,7)-(24,33)
(23,12)-(23,21)
(23,12)-(23,49)
(23,22)-(23,49)
(23,23)-(23,28)
(24,12)-(24,17)
(24,12)-(24,33)
*)

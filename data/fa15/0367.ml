
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
  | d -> if r = 0 then buildSine else build (rand, (d - 1));;


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

(21,24)-(21,33)
buildSine (build (rand , depth - 1))
AppG [AppG [EmptyG]]

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(15,4)-(15,23)
(15,12)-(15,21)
(17,4)-(21,62)
(17,16)-(21,60)
(18,3)-(21,60)
(19,3)-(21,60)
(20,10)-(20,50)
(20,44)-(20,50)
(21,10)-(21,60)
(21,24)-(21,33)
(21,39)-(21,44)
(21,39)-(21,60)
*)

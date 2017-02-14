
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
(20,31)-(20,37)
(20,43)-(20,49)
(21,9)-(21,59)
(21,23)-(21,32)
(21,45)-(21,49)
(21,51)-(21,58)
(21,52)-(21,53)
(21,56)-(21,57)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,3)-(13,22)
(13,11)-(13,20)
(13,11)-(13,20)
(19,2)-(21,59)
(19,2)-(21,59)
(20,9)-(20,49)
(20,31)-(20,37)
(21,9)-(21,59)
(21,23)-(21,32)
*)

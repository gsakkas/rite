
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
      then buildSine build (rand, (d - 1))
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
(20,44)-(20,50)
(22,7)-(24,31)
(23,12)-(23,41)
(23,22)-(23,27)
(23,36)-(23,37)
(24,19)-(24,23)
(24,26)-(24,27)
(24,26)-(24,31)
(24,30)-(24,31)
*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(17,4)-(24,35)
(17,16)-(24,31)
(23,12)-(23,21)
(23,12)-(23,41)
(23,22)-(23,27)
(24,12)-(24,17)
(24,12)-(24,31)
*)

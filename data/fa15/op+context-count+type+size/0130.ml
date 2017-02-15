
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
(20,31)-(20,37)
(20,43)-(20,49)
(22,6)-(24,32)
(23,11)-(23,42)
(23,21)-(23,26)
(23,35)-(23,36)
(24,18)-(24,22)
(24,24)-(24,31)
(24,25)-(24,26)
(24,29)-(24,30)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(17,3)-(24,34)
(17,15)-(24,32)
(23,11)-(23,20)
(23,11)-(23,42)
(23,21)-(23,26)
(24,11)-(24,16)
(24,11)-(24,32)
*)

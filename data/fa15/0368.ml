
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
      then buildSine build (rand, (depth - 1))
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
(23,11)-(23,46)
(23,21)-(23,26)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(17,3)-(24,34)
(17,15)-(24,32)
(23,11)-(23,20)
(23,11)-(23,46)
(23,21)-(23,26)
(24,11)-(24,16)
(24,11)-(24,32)
*)

(* all spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(24,32)
(18,2)-(24,32)
(18,10)-(18,25)
(18,10)-(18,14)
(18,15)-(18,25)
(18,16)-(18,17)
(18,19)-(18,24)
(19,2)-(24,32)
(19,8)-(19,13)
(20,9)-(20,49)
(20,12)-(20,25)
(20,12)-(20,21)
(20,13)-(20,14)
(20,19)-(20,20)
(20,24)-(20,25)
(20,31)-(20,37)
(20,43)-(20,49)
(22,6)-(24,32)
(22,9)-(22,14)
(22,9)-(22,10)
(22,13)-(22,14)
(23,11)-(23,46)
(23,11)-(23,20)
(23,21)-(23,26)
(23,27)-(23,46)
(23,28)-(23,32)
(23,34)-(23,45)
(23,35)-(23,40)
(23,43)-(23,44)
(24,11)-(24,32)
(24,11)-(24,16)
(24,17)-(24,32)
(24,18)-(24,22)
(24,24)-(24,31)
(24,25)-(24,26)
(24,29)-(24,30)
*)

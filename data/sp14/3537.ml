
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(22,18)-(22,22)
(23,6)-(25,43)
*)

(* type error slice
(20,18)-(20,22)
(20,18)-(20,29)
(22,6)-(25,43)
(22,18)-(22,22)
(23,9)-(23,14)
(23,9)-(23,18)
(23,17)-(23,18)
*)

(* all spans
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(27,73)
(18,2)-(27,73)
(18,8)-(18,13)
(20,6)-(20,75)
(20,18)-(20,29)
(20,18)-(20,22)
(20,23)-(20,29)
(20,24)-(20,25)
(20,27)-(20,28)
(20,33)-(20,75)
(20,36)-(20,45)
(20,36)-(20,41)
(20,44)-(20,45)
(20,51)-(20,60)
(20,51)-(20,57)
(20,58)-(20,60)
(20,66)-(20,75)
(20,66)-(20,72)
(20,73)-(20,75)
(22,6)-(25,43)
(22,18)-(22,22)
(23,6)-(25,43)
(23,9)-(23,18)
(23,9)-(23,14)
(23,17)-(23,18)
(24,11)-(24,45)
(24,18)-(24,45)
(24,19)-(24,24)
(24,25)-(24,44)
(24,26)-(24,30)
(24,32)-(24,43)
(24,33)-(24,38)
(24,41)-(24,42)
(25,11)-(25,43)
(25,16)-(25,43)
(25,17)-(25,22)
(25,23)-(25,42)
(25,24)-(25,28)
(25,30)-(25,41)
(25,31)-(25,36)
(25,39)-(25,40)
(26,9)-(26,75)
(26,18)-(26,45)
(26,19)-(26,24)
(26,25)-(26,44)
(26,26)-(26,30)
(26,32)-(26,43)
(26,33)-(26,38)
(26,41)-(26,42)
(26,47)-(26,74)
(26,48)-(26,53)
(26,54)-(26,73)
(26,55)-(26,59)
(26,61)-(26,72)
(26,62)-(26,67)
(26,70)-(26,71)
(27,9)-(27,73)
(27,16)-(27,43)
(27,17)-(27,22)
(27,23)-(27,42)
(27,24)-(27,28)
(27,30)-(27,41)
(27,31)-(27,36)
(27,39)-(27,40)
(27,45)-(27,72)
(27,46)-(27,51)
(27,52)-(27,71)
(27,53)-(27,57)
(27,59)-(27,70)
(27,60)-(27,65)
(27,68)-(27,69)
*)

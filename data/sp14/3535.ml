
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
  match rand with
  | 0 -> let halff = rand in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
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
(18,8)-(18,12)
(19,21)-(19,25)
(19,29)-(19,71)
*)

(* type error slice
(19,9)-(19,71)
(19,21)-(19,25)
(19,32)-(19,37)
(19,32)-(19,41)
(19,40)-(19,41)
(21,18)-(21,22)
(21,18)-(21,29)
*)

(* all spans
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(26,73)
(18,2)-(26,73)
(18,8)-(18,12)
(19,9)-(19,71)
(19,21)-(19,25)
(19,29)-(19,71)
(19,32)-(19,41)
(19,32)-(19,37)
(19,40)-(19,41)
(19,47)-(19,56)
(19,47)-(19,53)
(19,54)-(19,56)
(19,62)-(19,71)
(19,62)-(19,68)
(19,69)-(19,71)
(21,6)-(24,43)
(21,18)-(21,29)
(21,18)-(21,22)
(21,23)-(21,29)
(21,24)-(21,25)
(21,27)-(21,28)
(22,6)-(24,43)
(22,9)-(22,18)
(22,9)-(22,14)
(22,17)-(22,18)
(23,11)-(23,45)
(23,18)-(23,45)
(23,19)-(23,24)
(23,25)-(23,44)
(23,26)-(23,30)
(23,32)-(23,43)
(23,33)-(23,38)
(23,41)-(23,42)
(24,11)-(24,43)
(24,16)-(24,43)
(24,17)-(24,22)
(24,23)-(24,42)
(24,24)-(24,28)
(24,30)-(24,41)
(24,31)-(24,36)
(24,39)-(24,40)
(25,9)-(25,75)
(25,18)-(25,45)
(25,19)-(25,24)
(25,25)-(25,44)
(25,26)-(25,30)
(25,32)-(25,43)
(25,33)-(25,38)
(25,41)-(25,42)
(25,47)-(25,74)
(25,48)-(25,53)
(25,54)-(25,73)
(25,55)-(25,59)
(25,61)-(25,72)
(25,62)-(25,67)
(25,70)-(25,71)
(26,9)-(26,73)
(26,16)-(26,43)
(26,17)-(26,22)
(26,23)-(26,42)
(26,24)-(26,28)
(26,30)-(26,41)
(26,31)-(26,36)
(26,39)-(26,40)
(26,45)-(26,72)
(26,46)-(26,51)
(26,52)-(26,71)
(26,53)-(26,57)
(26,59)-(26,70)
(26,60)-(26,65)
(26,68)-(26,69)
*)

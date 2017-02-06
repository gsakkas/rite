
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
(18,9)-(18,13)
(19,22)-(19,26)
(19,30)-(19,72)
(25,20)-(25,43)
(25,49)-(25,72)
(26,18)-(26,41)
(26,47)-(26,70)
(26,61)-(26,66)
(26,69)-(26,70)
*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,12)-(13,21)
(13,17)-(13,21)
(15,4)-(15,23)
(15,12)-(15,21)
(15,12)-(15,21)
(15,17)-(15,21)
(17,16)-(26,70)
(18,3)-(26,70)
(18,3)-(26,70)
(18,3)-(26,70)
(18,9)-(18,13)
(19,10)-(19,72)
(19,10)-(19,72)
(19,22)-(19,26)
(19,30)-(19,72)
(19,30)-(19,72)
(19,33)-(19,38)
(19,33)-(19,42)
(19,33)-(19,42)
(19,33)-(19,42)
(19,41)-(19,42)
(19,48)-(19,54)
(19,48)-(19,57)
(19,55)-(19,57)
(19,63)-(19,69)
(19,63)-(19,72)
(19,70)-(19,72)
(21,7)-(24,41)
(21,19)-(21,23)
(21,19)-(21,29)
(21,25)-(21,26)
(21,25)-(21,29)
(21,28)-(21,29)
(22,10)-(22,15)
(22,10)-(22,19)
(23,20)-(23,25)
(23,20)-(23,43)
(23,34)-(23,39)
*)

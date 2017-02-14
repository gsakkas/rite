
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
  let rdm = rand in
  match rdm with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  let rdm = rand (0, 7) in
  match rdm with
  | 0 -> buildY ()
  | 1 -> buildX ()
  | 2 -> Cosine (build (rand, (depth - 1)))
  | 3 -> Sine (build (rand, (depth - 1)))
  | 4 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(18,12)-(18,16)
(19,2)-(32,67)
(19,8)-(19,11)
(21,6)-(21,75)
(21,27)-(21,28)
(21,33)-(21,75)
(21,36)-(21,41)
(21,36)-(21,45)
(21,44)-(21,45)
(21,51)-(21,60)
(23,6)-(26,43)
(23,18)-(23,22)
(23,18)-(23,29)
(23,23)-(23,29)
(23,24)-(23,25)
(23,27)-(23,28)
(24,6)-(26,43)
(24,9)-(24,14)
(24,9)-(24,18)
(24,17)-(24,18)
(32,39)-(32,66)
*)

(* type error slice
(18,2)-(32,67)
(18,12)-(18,16)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,2)-(32,67)
(19,8)-(19,11)
(21,18)-(21,22)
(21,18)-(21,29)
*)

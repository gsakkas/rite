
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
(18,13)-(18,17)
(19,3)-(32,64)
(19,9)-(19,12)
(21,7)-(21,76)
(21,28)-(21,29)
(21,34)-(21,76)
(21,37)-(21,42)
(21,37)-(21,46)
(21,45)-(21,46)
(21,52)-(21,61)
(23,7)-(26,41)
(23,19)-(23,23)
(23,19)-(23,29)
(23,25)-(23,26)
(23,25)-(23,29)
(23,28)-(23,29)
(24,7)-(26,41)
(24,10)-(24,15)
(24,10)-(24,19)
(24,18)-(24,19)
(32,41)-(32,64)
*)

(* type error slice
(18,3)-(32,64)
(18,13)-(18,17)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,3)-(32,64)
(19,9)-(19,12)
(21,19)-(21,23)
(21,19)-(21,29)
*)

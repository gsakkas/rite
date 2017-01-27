
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
  let newRand = rand (0, 4) in
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (newRand, (depth - 1)))
      else Sine (build (newRand, (depth - 1)))
  | 2 ->
      Average
        ((build (newRand, (depth - 1))), (build (newRand, (depth - 1))))
  | 3 ->
      Times ((build (newRand, (depth - 1))), (build (newRand, (depth - 1))));;


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
(18,3)-(31,73)
(18,17)-(18,21)
(18,17)-(18,27)
(18,23)-(18,24)
(18,23)-(18,27)
(18,26)-(18,27)
(25,27)-(25,34)
(26,25)-(26,32)
(29,18)-(29,25)
(29,50)-(29,57)
(31,22)-(31,29)
*)

(* type error slice
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(17,4)-(31,79)
(17,16)-(31,73)
(18,3)-(31,73)
(18,17)-(18,21)
(18,17)-(18,27)
(18,23)-(18,24)
(18,23)-(18,27)
(18,26)-(18,27)
(19,3)-(31,73)
(21,7)-(21,76)
(21,34)-(21,76)
(21,52)-(21,58)
(21,52)-(21,61)
(21,59)-(21,61)
(25,20)-(25,25)
(25,20)-(25,46)
(25,27)-(25,34)
(25,27)-(25,46)
(25,37)-(25,42)
(25,37)-(25,46)
*)

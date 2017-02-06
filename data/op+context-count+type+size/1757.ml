
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
(22,19)-(22,23)
(23,7)-(25,41)
(26,20)-(26,43)
(26,49)-(26,72)
(27,18)-(27,41)
(27,47)-(27,70)
(27,61)-(27,66)
(27,69)-(27,70)
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
(17,16)-(27,70)
(18,3)-(27,70)
(18,3)-(27,70)
(18,3)-(27,70)
(18,9)-(18,14)
(20,7)-(20,76)
(20,7)-(20,76)
(20,19)-(20,23)
(20,19)-(20,29)
(20,19)-(20,29)
(20,25)-(20,26)
(20,25)-(20,29)
(20,28)-(20,29)
(20,34)-(20,76)
(20,34)-(20,76)
(20,37)-(20,42)
(20,37)-(20,46)
(20,37)-(20,46)
(20,37)-(20,46)
(20,45)-(20,46)
(20,52)-(20,58)
(20,52)-(20,61)
(20,59)-(20,61)
(20,67)-(20,73)
(20,67)-(20,76)
(20,74)-(20,76)
(22,7)-(25,41)
(22,19)-(22,23)
(23,10)-(23,15)
(23,10)-(23,19)
(23,10)-(23,19)
(23,18)-(23,19)
(24,20)-(24,25)
(24,20)-(24,43)
(24,34)-(24,39)
*)

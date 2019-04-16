
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
(18,3)-(31,77)
match depth with
| 0 -> (let halff =
          rand (0 , 2) in
        if halff = 0
        then buildY ()
        else buildX ())
| 1 -> (let halff =
          rand (0 , 2) in
        if halff = 0
        then Cosine (build (rand , depth - 1))
        else Sine (build (rand , depth - 1)))
| 2 -> Average (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> Times (build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(LitPatG,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG),(LitPatG,Nothing,ConAppG (Just EmptyG))])

*)

(* type error slice
(17,4)-(31,79)
(17,16)-(31,77)
(18,3)-(31,77)
(18,17)-(18,21)
(18,17)-(18,28)
(25,19)-(25,49)
(25,20)-(25,25)
(25,26)-(25,48)
(25,27)-(25,34)
*)

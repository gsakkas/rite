
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

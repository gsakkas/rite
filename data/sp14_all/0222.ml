
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then VarX else VarY)
  else (let y = rand (2, 6) in if y = 2 then y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(13,35)-(13,39)
buildX ()
AppG (fromList [ConAppG Nothing])

(13,45)-(13,49)
buildY ()
AppG (fromList [ConAppG Nothing])

(14,32)-(14,47)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(13,12)-(13,25)
(13,12)-(13,29)
(13,13)-(13,17)
(13,28)-(13,29)
(14,8)-(14,48)
(14,17)-(14,21)
(14,17)-(14,28)
(14,32)-(14,47)
(14,46)-(14,47)
(14,47)-(14,47)
*)


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
(11,15)-(14,47)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(11,15)-(14,47)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(11,15)-(14,47)
VarX
ConAppG Nothing Nothing

(11,15)-(14,47)
VarY
ConAppG Nothing Nothing

(13,44)-(13,48)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(14,7)-(14,47)
buildX
VarG

(14,7)-(14,47)
buildY
VarG

(14,7)-(14,47)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(14,7)-(14,47)
()
ConAppG Nothing (Just (TApp "unit" []))

(14,7)-(14,47)
()
ConAppG Nothing (Just (TApp "unit" []))

(14,31)-(14,46)
buildX
VarG

(14,45)-(14,46)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | 1 -> VarX
  | 2 -> 22
  | 3 -> 33
  | 4 -> 44
  | 5 -> 55
  | 6 -> 66
  | 7 -> 77;;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildX ()
  | 4 -> buildY ()
  | 5 -> buildX ()
  | 6 -> buildY ()
  | 7 -> buildX ();;

*)

(* changed spans
(11,15)-(19,11)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(11,15)-(19,11)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(11,15)-(19,11)
VarX
ConAppG Nothing Nothing

(11,15)-(19,11)
VarY
ConAppG Nothing Nothing

(19,9)-(19,11)
buildX ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

*)

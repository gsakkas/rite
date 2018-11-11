
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
  if depth = 0 then (if (rand (0, 1)) = 0 then buildX () else buildY ());;


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
(16,2)-(16,72)
rand
VarG

(16,2)-(16,72)
buildX
VarG

(16,2)-(16,72)
rand (2 , 6)
AppG [TupleG [EmptyG,EmptyG]]

(16,2)-(16,72)
buildX ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

(16,2)-(16,72)
2
LitG

(16,2)-(16,72)
6
LitG

(16,2)-(16,72)
let y = rand (2 , 6) in
buildX ()
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG])

(16,2)-(16,72)
(2 , 6)
TupleG [LitG,LitG]

*)

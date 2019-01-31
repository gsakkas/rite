
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(15,15)-(20,50)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(15,15)-(20,50)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(15,15)-(20,50)
VarX
ConAppG Nothing Nothing

(15,15)-(20,50)
VarY
ConAppG Nothing Nothing

(16,2)-(20,50)
rand
VarG

(16,2)-(20,50)
buildX
VarG

(16,2)-(20,50)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(16,2)-(20,50)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(16,2)-(20,50)
0
LitG

(16,2)-(20,50)
1
LitG

(16,2)-(20,50)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(16,2)-(20,50)
(0 , 1)
TupleG (fromList [LitG])

*)

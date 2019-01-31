
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
    match rand with
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)))
  else ();;


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
(15,15)-(21,9)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(15,15)-(21,9)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(15,15)-(21,9)
VarX
ConAppG Nothing Nothing

(15,15)-(21,9)
VarY
ConAppG Nothing Nothing

(18,4)-(20,56)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(18,10)-(18,14)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,16)-(19,53)
0
LitG

(19,16)-(19,53)
4
LitG

(19,16)-(19,53)
(0 , 4)
TupleG (fromList [LitG])

(21,7)-(21,9)
rand
VarG

(21,7)-(21,9)
buildX
VarG

(21,7)-(21,9)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(21,7)-(21,9)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(21,7)-(21,9)
0
LitG

(21,7)-(21,9)
1
LitG

(21,7)-(21,9)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(21,7)-(21,9)
(0 , 1)
TupleG (fromList [LitG])

*)

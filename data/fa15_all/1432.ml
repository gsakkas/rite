
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
    match rand with
    | (0,2) -> buildX (build (rand, (depth - 1)))
    | (3,5) -> buildY ()
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)));;


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
(20,2)-(26,56)
rand
VarG

(20,2)-(26,56)
buildX
VarG

(20,2)-(26,56)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,2)-(26,56)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,2)-(26,56)
0
LitG

(20,2)-(26,56)
1
LitG

(20,2)-(26,56)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(20,2)-(26,56)
(0 , 1)
TupleG (fromList [LitG])

(23,15)-(23,21)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(24,22)-(24,24)
(0 , 4)
TupleG (fromList [LitG])

(25,16)-(25,53)
0
LitG

(25,16)-(25,53)
4
LitG

*)

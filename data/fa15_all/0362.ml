
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
  let r = rand (0. depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d -> if r = 0 then build (rand, (d - 1)) else build (rand, (d - 1));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;

*)

(* changed spans
(11,11)-(11,20)
e
VarG

(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(11,11)-(11,20)
Sine e
ConAppG (Just VarG) Nothing

(16,16)-(16,18)
(0 , depth)
TupleG (fromList [VarG,LitG])

(16,19)-(16,24)
0
LitG

(18,31)-(18,37)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(18,43)-(18,49)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(18,43)-(18,49)
()
ConAppG Nothing (Just (TApp "unit" []))

(19,9)-(19,71)
()
ConAppG Nothing (Just (TApp "unit" []))

(19,23)-(19,28)
buildSine
VarG

(19,23)-(19,28)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,37)-(19,38)
depth
VarG

*)

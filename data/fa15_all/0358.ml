
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
  let r = rand 0.4 in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildSine build (rand, (d - 1))
      else buildCosine build (rand, (d - 1));;


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
(20,15)-(20,18)
(0 , depth)
TupleG (fromList [VarG,LitG])

(21,2)-(26,44)
depth
VarG

(21,2)-(26,44)
0
LitG

(22,31)-(22,37)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(22,43)-(22,49)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(22,43)-(22,49)
()
ConAppG Nothing (Just (TApp "unit" []))

(24,6)-(26,44)
()
ConAppG Nothing (Just (TApp "unit" []))

(25,11)-(25,42)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(25,21)-(25,26)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(25,35)-(25,36)
depth
VarG

(26,11)-(26,22)
build (rand , d - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

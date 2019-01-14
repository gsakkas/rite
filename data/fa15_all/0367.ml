
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
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d -> if r = 0 then buildSine else build (rand, (d - 1));;


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
(20,31)-(20,37)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,43)-(20,49)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,43)-(20,49)
()
ConAppG Nothing (Just (TApp "unit" []))

(21,9)-(21,59)
()
ConAppG Nothing (Just (TApp "unit" []))

(21,23)-(21,32)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(21,52)-(21,53)
depth
VarG

(21,52)-(21,53)
build
VarG

(21,52)-(21,53)
rand
VarG

(21,52)-(21,53)
build (rand , d - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(21,52)-(21,53)
d - 1
BopG VarG LitG

(21,52)-(21,53)
1
LitG

(21,52)-(21,53)
(rand , d - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)

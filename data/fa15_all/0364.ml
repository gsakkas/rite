
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildCosine build (rand, (d - 1))
      else build (rand, (d - 1));;


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
(11,20)-(11,28)
Sine e
ConAppG (Just VarG) Nothing

(20,31)-(20,37)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,43)-(20,49)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,43)-(20,49)
()
ConAppG Nothing (Just (TApp "unit" []))

(22,6)-(24,32)
()
ConAppG Nothing (Just (TApp "unit" []))

(23,11)-(23,22)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(23,23)-(23,28)
buildSine
VarG

(23,23)-(23,28)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,37)-(23,38)
depth
VarG

*)

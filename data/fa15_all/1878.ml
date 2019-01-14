
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
  match depth with
  | 0 -> ()
  | 1 -> if (rand mod 2) = 0 then buildX else buildY
  | n when n > 1 -> buildSine (build (rand, (depth - 1)));;


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
  match depth with
  | 0 -> if true then buildX () else buildY ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(18,2)-(21,57)
match depth with
| 0 -> if true
       then buildX ()
       else buildY ()
| n -> buildSine (build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

(20,13)-(20,17)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,22)-(20,23)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,22)-(20,23)
()
ConAppG Nothing (Just (TApp "unit" []))

(20,27)-(20,28)
true
LitG

(20,27)-(20,28)
()
ConAppG Nothing (Just (TApp "unit" []))

*)

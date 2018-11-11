
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
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> let y = rand (2, 6) in y;;


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
(16,2)-(18,33)
if depth = 0
then if rand (0 , 1) = 0
     then buildX ()
     else buildY ()
else (let y = rand (2 , 6) in
      buildX ())
IteG (BopG EmptyG EmptyG) (IteG EmptyG EmptyG EmptyG) (LetG NonRec [EmptyG] EmptyG)

(16,8)-(16,13)
depth = 0
BopG VarG LitG

(17,9)-(17,59)
0
LitG

(18,32)-(18,33)
buildX ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

*)

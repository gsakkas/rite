
let rec build (rand,depth) = rand + build;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) = if 1 > 0 then VarY else VarY;;

*)

(* changed spans
(2,36)-(2,41)
if 1 > 0 then VarY else VarY
IteG (BopG EmptyG EmptyG) (ConAppG Nothing Nothing) (ConAppG Nothing Nothing)

*)

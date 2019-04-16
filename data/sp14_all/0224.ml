
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
  if depth = 0 then (if (rand (0, 1)) = 0 then buildX () else buildY ());;


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
(16,73)-(16,73)
let y = rand (2 , 6) in
buildX ()
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(16,3)-(16,73)
(16,21)-(16,73)
(16,63)-(16,69)
(16,63)-(16,72)
(16,73)-(16,73)
*)

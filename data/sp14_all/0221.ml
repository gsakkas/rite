
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
  let y = rand (2, 6) in
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else if y = 2 then y;;


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
(16,3)-(19,23)
if depth = 0
then if rand (0 , 1) = 0
     then buildX ()
     else buildY ()
else (let y = rand (2 , 6) in
      buildX ())
IteG (BopG EmptyG EmptyG) (IteG EmptyG EmptyG EmptyG) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(16,3)-(19,23)
(16,11)-(16,15)
(16,11)-(16,22)
(18,12)-(18,25)
(18,12)-(18,29)
(18,13)-(18,17)
(18,28)-(18,29)
(19,8)-(19,23)
(19,22)-(19,23)
(19,23)-(19,23)
*)

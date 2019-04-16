
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
  | _ -> let y = rand (2, 6) in if y = 2 then buildX ();;


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
(16,3)-(18,56)
if depth = 0
then if rand (0 , 1) = 0
     then buildX ()
     else buildY ()
else (let y = rand (2 , 6) in
      buildX ())
IteG (BopG EmptyG EmptyG) (IteG EmptyG EmptyG EmptyG) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(16,3)-(18,56)
(17,10)-(17,60)
(17,51)-(17,57)
(17,51)-(17,60)
(18,10)-(18,56)
(18,33)-(18,56)
(18,47)-(18,53)
(18,47)-(18,56)
(18,56)-(18,56)
*)

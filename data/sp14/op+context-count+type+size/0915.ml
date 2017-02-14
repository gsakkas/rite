
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
(16,3)-(18,34)
(16,9)-(16,14)
(17,10)-(17,60)
(18,10)-(18,34)
(18,33)-(18,34)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(16,3)-(18,34)
(16,3)-(18,34)
(17,10)-(17,60)
(17,14)-(17,18)
(17,14)-(17,24)
(17,14)-(17,30)
(17,14)-(17,30)
(17,29)-(17,30)
(17,36)-(17,42)
(17,36)-(17,45)
(18,10)-(18,34)
(18,10)-(18,34)
(18,18)-(18,22)
(18,18)-(18,28)
(18,33)-(18,34)
*)

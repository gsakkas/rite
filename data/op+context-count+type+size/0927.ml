
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
  | _ -> let y = rand (2, 6) in if y == 2 then buildX ();;


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
(16,3)-(18,57)
(16,9)-(16,14)
(17,10)-(17,60)
(18,33)-(18,57)
(18,36)-(18,37)
(18,36)-(18,42)
(18,41)-(18,42)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(18,59)
(15,16)-(18,57)
(16,9)-(16,14)
(17,10)-(17,60)
(17,10)-(17,60)
(17,14)-(17,18)
(17,14)-(17,24)
(17,14)-(17,30)
(17,36)-(17,42)
(17,36)-(17,45)
(17,51)-(17,57)
(17,51)-(17,60)
(18,33)-(18,57)
(18,48)-(18,54)
(18,48)-(18,57)
*)


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
  | _ -> let y = rand (2, 6) in if y = 2 then y;;


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
(16,2)-(18,47)
(16,8)-(16,13)
(17,9)-(17,59)
(18,32)-(18,47)
(18,35)-(18,36)
(18,35)-(18,40)
(18,39)-(18,40)
(18,46)-(18,47)
*)

(* type error slice
(17,12)-(17,25)
(17,12)-(17,29)
(17,13)-(17,17)
(17,28)-(17,29)
(18,9)-(18,47)
(18,17)-(18,21)
(18,17)-(18,28)
(18,32)-(18,47)
(18,46)-(18,47)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(18,47)
(16,2)-(18,47)
(16,8)-(16,13)
(17,9)-(17,59)
(17,12)-(17,29)
(17,12)-(17,25)
(17,13)-(17,17)
(17,18)-(17,24)
(17,19)-(17,20)
(17,22)-(17,23)
(17,28)-(17,29)
(17,35)-(17,44)
(17,35)-(17,41)
(17,42)-(17,44)
(17,50)-(17,59)
(17,50)-(17,56)
(17,57)-(17,59)
(18,9)-(18,47)
(18,17)-(18,28)
(18,17)-(18,21)
(18,22)-(18,28)
(18,23)-(18,24)
(18,26)-(18,27)
(18,32)-(18,47)
(18,35)-(18,40)
(18,35)-(18,36)
(18,39)-(18,40)
(18,46)-(18,47)
*)

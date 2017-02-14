
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
  | _ -> let y = rand (2, 6) in if y = 2 then 5;;


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
(18,9)-(18,47)
(18,32)-(18,47)
(18,35)-(18,36)
(18,35)-(18,40)
(18,39)-(18,40)
(18,46)-(18,47)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(16,2)-(18,47)
(16,2)-(18,47)
(17,9)-(17,59)
(17,35)-(17,41)
(17,35)-(17,44)
(18,9)-(18,47)
(18,32)-(18,47)
(18,32)-(18,47)
(18,32)-(18,47)
(18,46)-(18,47)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then VarX else VarY)
  else (let y = rand (2, 6) in if y = 2 then y);;


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
(11,16)-(14,47)
(13,35)-(13,39)
(13,45)-(13,49)
(14,9)-(14,47)
(14,17)-(14,21)
(14,32)-(14,47)
(14,35)-(14,36)
(14,35)-(14,40)
(14,39)-(14,40)
(14,46)-(14,47)
*)

(* type error slice
(12,3)-(14,47)
(12,3)-(14,47)
(13,9)-(13,49)
(13,13)-(13,17)
(13,13)-(13,23)
(13,13)-(13,29)
(13,13)-(13,29)
(13,28)-(13,29)
(13,35)-(13,39)
(14,9)-(14,47)
(14,9)-(14,47)
(14,17)-(14,21)
(14,17)-(14,27)
(14,32)-(14,47)
(14,32)-(14,47)
(14,32)-(14,47)
(14,46)-(14,47)
*)

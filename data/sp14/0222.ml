
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
(11,15)-(14,47)
(13,34)-(13,38)
(13,44)-(13,48)
(14,7)-(14,47)
(14,31)-(14,46)
(14,34)-(14,35)
(14,34)-(14,39)
(14,38)-(14,39)
(14,45)-(14,46)
*)

(* type error slice
(13,11)-(13,24)
(13,11)-(13,28)
(13,12)-(13,16)
(13,27)-(13,28)
(14,7)-(14,47)
(14,16)-(14,20)
(14,16)-(14,27)
(14,31)-(14,46)
(14,45)-(14,46)
*)

(* all spans
(11,15)-(14,47)
(12,2)-(14,47)
(12,5)-(12,14)
(12,5)-(12,10)
(12,13)-(12,14)
(13,7)-(13,49)
(13,11)-(13,28)
(13,11)-(13,24)
(13,12)-(13,16)
(13,17)-(13,23)
(13,18)-(13,19)
(13,21)-(13,22)
(13,27)-(13,28)
(13,34)-(13,38)
(13,44)-(13,48)
(14,7)-(14,47)
(14,16)-(14,27)
(14,16)-(14,20)
(14,21)-(14,27)
(14,22)-(14,23)
(14,25)-(14,26)
(14,31)-(14,46)
(14,34)-(14,39)
(14,34)-(14,35)
(14,38)-(14,39)
(14,45)-(14,46)
*)

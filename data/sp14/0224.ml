
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
(16,2)-(16,72)
*)

(* type error slice
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(16,2)-(16,72)
(16,20)-(16,72)
(16,62)-(16,68)
(16,62)-(16,71)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(16,72)
(16,2)-(16,72)
(16,5)-(16,14)
(16,5)-(16,10)
(16,13)-(16,14)
(16,20)-(16,72)
(16,24)-(16,41)
(16,24)-(16,37)
(16,25)-(16,29)
(16,30)-(16,36)
(16,31)-(16,32)
(16,34)-(16,35)
(16,40)-(16,41)
(16,47)-(16,56)
(16,47)-(16,53)
(16,54)-(16,56)
(16,62)-(16,71)
(16,62)-(16,68)
(16,69)-(16,71)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with | 0 -> buildX | n -> buildSine (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(16,26)-(16,32)
(16,40)-(16,77)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,3)-(13,22)
(13,11)-(13,20)
(15,3)-(16,79)
(15,15)-(16,77)
(16,2)-(16,77)
(16,26)-(16,32)
(16,40)-(16,49)
(16,40)-(16,77)
(16,50)-(16,77)
(16,51)-(16,56)
*)

(* all spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(16,77)
(16,2)-(16,77)
(16,8)-(16,13)
(16,26)-(16,32)
(16,40)-(16,77)
(16,40)-(16,49)
(16,50)-(16,77)
(16,51)-(16,56)
(16,57)-(16,76)
(16,58)-(16,62)
(16,64)-(16,75)
(16,65)-(16,70)
(16,73)-(16,74)
*)

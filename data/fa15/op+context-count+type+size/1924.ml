
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | (0,2) -> buildX ()
    | (3,5) -> buildY ()
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)))
  else ();;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(22,5)-(26,54)
(22,11)-(22,15)
(23,16)-(23,22)
(23,16)-(23,25)
(23,23)-(23,25)
(24,16)-(24,22)
(24,23)-(24,25)
(25,17)-(25,51)
(27,8)-(27,10)
*)

(* type error slice
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(20,3)-(27,10)
(20,3)-(27,10)
(22,5)-(26,54)
(23,16)-(23,22)
(23,16)-(23,25)
(27,8)-(27,10)
*)

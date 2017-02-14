
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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else
    (let num = rand (0, 4) in
     if num = 0
     then buildSine (build (rand, (depth - 1)))
     else if num = 1 then buildCosine (build (rand, (depth - 1))));;


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
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else
    (let num = rand (0, 4) in
     if num = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if num = 1 then buildCosine (build (rand, (depth - 1))) else buildX ());;

*)

(* changed spans
(26,10)-(26,65)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(11,20)-(11,28)
(26,10)-(26,65)
(26,10)-(26,65)
(26,10)-(26,65)
(26,26)-(26,37)
(26,26)-(26,65)
*)
